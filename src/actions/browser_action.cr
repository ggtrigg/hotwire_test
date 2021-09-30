abstract class BrowserAction < Lucky::Action
  include Lucky::ProtectFromForgery
  include Lucky::EnforceUnderscoredRoute

  # This module disables Google FLoC by setting the
  # [Permissions-Policy](https://github.com/WICG/floc) HTTP header to `interest-cohort=()`.
  #
  # This header is a part of Google's Federated Learning of Cohorts (FLoC) which is used
  # to track browsing history instead of using 3rd-party cookies.
  #
  # Remove this include if you want to use the FLoC tracking.
  include Lucky::SecureHeaders::DisableFLoC

  accepted_formats [:html, :json], default: :html
  
  if LuckyEnv.production?
    route_prefix "/hotwire_test"
  end
end
