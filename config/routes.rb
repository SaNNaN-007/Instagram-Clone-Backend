Rails.application.routes.draw do
  devise_for :users, path: 'users', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  }, controllers: { registrations: 'custom_registrations', sessions: 'custom_sessions' }
end
