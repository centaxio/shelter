class Registry
  include HTTParty
  base_uri Settings.registry_endpoint

  def initialize(params = {})
    @is_system = params[:is_system] || false
    @user = params[:user]
    @repository_name = params[:repository]
  end

  def repositories
    self.class.get('/v2/_catalog', headers: headers_for_scope('registry:catalog:*'))['repositories']
  end

  def tags
    self.class.get("/v2/#{@repository_name}/tags/list", headers: headers_for_scope("repository:#{@repository_name}:pull"))['tags']
  end

  def manifests(reference)
    JSON.parse self.class.get("/v2/#{@repository_name}/manifests/#{reference}", headers: headers_for_scope("repository:#{@repository_name}:pull"))
  end

  def token(scope)
    rsa_private_key = OpenSSL::PKey::RSA.new(File.read(File.join(Rails.root, 'config', 'private_key.pem')))

    payload = {
      iss: 'registry-token-issuer',
      sub: (@user&.username || ''),
      aud: 'token-service',
      exp: 10.minutes.from_now.to_i,
      nbf: 1.minutes.ago.to_i,
      iat: Time.now.to_i,
      jti: SecureRandom.uuid,
      access: []
    }
    payload[:sub] = 'system-service' if @is_system

    if scope
      scope_type, scope_name, scope_actions = scope.split(':')
      scope_actions = scope_actions.split(',')
      if @is_system
        payload[:access] << {
          type: scope_type,
          name: scope_name,
          actions: scope_actions
        }
      else
        case scope_type
        when 'repository'
          namespace_name = scope_name.split('/').length == 2 ? scope_name.split('/')[0] : 'library'
          namespace = Namespace.find_by(name: namespace_name)
          repository_team = RepositoryTeam.find_by(repository_name: scope_name)
          if namespace.user == @user || repository_team.team.users.include?(@user) && 
          end
        end
      end
    end

    header = {
      kid: Base32.encode(Digest::SHA256.digest(rsa_private_key.public_key.to_der)[0...30]).scan(/.{4}/).join(':')
    }

    JWT.encode payload, rsa_private_key, 'RS256', header
  end

  private

  def headers_for_scope(scope)
    { 'Authorization': 'Bearer ' + token(scope) }
  end
end
