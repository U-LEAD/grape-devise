module Grape
  module Devise
    module Helpers
      def warden
        env['warden']
      end

      def current_user
        warden.user
      end
      
      def authenticated?
        warden.authenticated?
      end

      def authenticate!
        handle_not_authenticated unless authenticated?
      end

      def handle_not_authenticated
        error!({message:'401 Unauthorized!'}, 401)
      end
      
      def logout!
        warden.logout
      end
    end
  end
end
