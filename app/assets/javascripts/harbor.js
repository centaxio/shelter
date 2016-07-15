//= require ./harbor/harbor.module
//= require ./harbor/harbor.config
//= require ./harbor/harbor.initialize
//= require ./harbor/harbor.data

//= require ./harbor/layout/header/header.module
//= require ./harbor/layout/header/header.controller

//= require ./harbor/layout/footer/footer.module
//= require ./harbor/layout/footer/footer.controller

//= require ./harbor/layout/navigation/navigation.module
//= require ./harbor/layout/navigation/navigation-header.directive
//= require ./harbor/layout/navigation/navigation-details.directive
//= require ./harbor/layout/navigation/navigation-admin-options.directive

//= require ./harbor/layout/sign-up/sign-up.module
//= require ./harbor/layout/sign-up/sign-up.controller

//= require ./harbor/layout/add-new/add-new.module
//= require ./harbor/layout/add-new/add-new.controller

//= require ./harbor/layout/account-setting/account-setting.module
//= require ./harbor/layout/account-setting/account-setting.controller

//= require ./harbor/layout/forgot-password/forgot-password.module
//= require ./harbor/layout/forgot-password/forgot-password.controller

//= require ./harbor/layout/change-password/change-password.module
//= require ./harbor/layout/change-password/change-password.controller

//= require ./harbor/layout/reset-password/reset-password.module
//= require ./harbor/layout/reset-password/reset-password.controller

//= require ./harbor/layout/index/index.module
//= require ./harbor/layout/index/index.controller

//= require ./harbor/layout/dashboard/dashboard.module
//= require ./harbor/layout/dashboard/dashboard.controller

//= require ./harbor/layout/project/project.module
//= require ./harbor/layout/project/project.controller

//= require ./harbor/layout/details/details.module
//= require ./harbor/layout/details/details.config
//= require ./harbor/layout/details/details.controller

//= require ./harbor/layout/admin-option/admin-option.module
//= require ./harbor/layout/admin-option/admin-option.controller
//= require ./harbor/layout/admin-option/admin-option.config

//= require ./harbor/layout/search/search.module
//= require ./harbor/layout/search/search.controller

//= require ./harbor/components/element-height/element-height.module
//= require ./harbor/components/element-height/element-height.inspector

//= require ./harbor/services/search/services.search.module
//= require ./harbor/services/search/services.search

//= require ./harbor/services/project/services.project.module
//= require ./harbor/services/project/services.list-project
//= require ./harbor/services/project/services.add-project
//= require ./harbor/services/project/services.toggle-project-publicity
//= require ./harbor/services/project/services.stat-project

//= require ./harbor/services/user/services.user.module
//= require ./harbor/services/user/services.current-user
//= require ./harbor/services/user/services.sign-in
//= require ./harbor/services/user/services.sign-up
//= require ./harbor/services/user/services.user-exist
//= require ./harbor/services/user/services.change-password
//= require ./harbor/services/user/services.send-mail
//= require ./harbor/services/user/services.reset-password
//= require ./harbor/services/user/services.list-user
//= require ./harbor/services/user/services.toggle-admin
//= require ./harbor/services/user/services.delete-user
//= require ./harbor/services/user/services.log-out
//= require ./harbor/services/user/services.update-user

//= require ./harbor/services/repository/services.repository.module
//= require ./harbor/services/repository/services.list-repository
//= require ./harbor/services/repository/services.list-tag
//= require ./harbor/services/repository/services.list-manifest
//= require ./harbor/services/repository/services.delete-repository
//= require ./harbor/services/repository/services.list-top-repository

//= require ./harbor/services/project-member/services.project-member.module
//= require ./harbor/services/project-member/services.current-project-member
//= require ./harbor/services/project-member/services.add-project-member
//= require ./harbor/services/project-member/services.list-project-member
//= require ./harbor/services/project-member/services.edit-project-member
//= require ./harbor/services/project-member/services.delete-project-member

//= require ./harbor/services/log/services.log.module
//= require ./harbor/services/log/services.list-log
//= require ./harbor/services/log/services.list-integrated-log

//= require ./harbor/services/replication-policy/services.replication-policy.module
//= require ./harbor/services/replication-policy/services.list-replication-policy
//= require ./harbor/services/replication-policy/services.create-replication-policy
//= require ./harbor/services/replication-policy/services.toggle-replication-policy
//= require ./harbor/services/replication-policy/services.update-replication-policy

//= require ./harbor/services/replication-job/services.replication-job.module
//= require ./harbor/services/replication-job/services.list-replication-job

//= require ./harbor/services/destination/services.destination.module
//= require ./harbor/services/destination/services.create-destination
//= require ./harbor/services/destination/services.list-destination
//= require ./harbor/services/destination/services.ping-destination
//= require ./harbor/services/destination/services.update-destination
//= require ./harbor/services/destination/services.delete-destination
//= require ./harbor/services/destination/services.list-destination-policy

//= require ./harbor/session/session.module
//= require ./harbor/session/session.current-user

//= require ./harbor/components/optional-menu/optional-menu.module
//= require ./harbor/components/optional-menu/optional-menu.directive

//= require ./harbor/components/modal-dialog/modal-dialog.module
//= require ./harbor/components/modal-dialog/modal-dialog.directive

//= require ./harbor/components/validator/validator.module
//= require ./harbor/components/validator/validator.config

//= require ./harbor/components/validator/password.validator
//= require ./harbor/components/validator/confirm-password.validator
//= require ./harbor/components/validator/user-exist.validator
//= require ./harbor/components/validator/invalid-chars.validator
//= require ./harbor/components/validator/project-name.validator

//= require ./harbor/components/search/search.module
//= require ./harbor/components/search/search.directive
//= require ./harbor/components/search/search-input.directive

//= require ./harbor/components/sign-in/sign-in.module
//= require ./harbor/components/sign-in/sign-in.directive

//= require ./harbor/components/project/project.module
//= require ./harbor/components/project/add-project.directive
//= require ./harbor/components/project/publicity-button.directive

//= require ./harbor/components/details/switch-pane-projects.directive
//= require ./harbor/components/details/retrieve-projects.directive

//= require ./harbor/components/repository/repository.module
//= require ./harbor/components/repository/list-repository.directive
//= require ./harbor/components/repository/list-tag.directive
//= require ./harbor/components/repository/popup-details.directive
//= require ./harbor/components/repository/pull-command.directive

//= require ./harbor/components/project-member/project-member.module
//= require ./harbor/components/project-member/project-member.config
//= require ./harbor/components/project-member/add-project-member.directive
//= require ./harbor/components/project-member/switch-role.directive
//= require ./harbor/components/project-member/list-project-member.directive
//= require ./harbor/components/project-member/edit-project-member.directive

//= require ./harbor/components/user/user.module
//= require ./harbor/components/user/list-user.directive
//= require ./harbor/components/user/toggle-admin.directive

//= require ./harbor/components/log/log.module
//= require ./harbor/components/log/log.config
//= require ./harbor/components/log/list-log.directive
//= require ./harbor/components/log/advanced-search.directive


//= require ./harbor/components/replication/replication.module
//= require ./harbor/components/replication/list-replication.directive
//= require ./harbor/components/replication/create-policy.directive

//= require ./harbor/components/system-management/system-management.module
//= require ./harbor/components/system-management/system-management.directive
//= require ./harbor/components/system-management/destination.directive
//= require ./harbor/components/system-management/create-destination.directive
//= require ./harbor/components/system-management/replication.directive
//= require ./harbor/components/system-management/configuration.directive


//= require ./harbor/components/summary/summary.module
//= require ./harbor/components/summary/summary.directive

//= require ./harbor/components/user-log/user-log.module
//= require ./harbor/components/user-log/user-log.directive

//= require ./harbor/components/top-repository/top-repository.module
//= require ./harbor/components/top-repository/top-repository.directive

//= require ./harbor/components/loading-progress/loading-progress.module
//= require ./harbor/components/loading-progress/loading-progress.directive

//= require ./harbor/components/inline-help/inline-help.module
//= require ./harbor/components/inline-help/inline-help.directive

//= require ./harbor/components/dismissable-alerts/dismissable-alerts.module
//= require ./harbor/components/dismissable-alerts/dismissable-alerts.directive

//= require ./harbor/services/i18n/services.i18n.module
//= require ./harbor/services/i18n/locale_messages_zh-CN
//= require ./harbor/services/i18n/services.i18n
