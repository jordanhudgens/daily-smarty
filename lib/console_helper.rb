module ConsoleHelper
  module Console
    def u(email = nil)
      if email
        User.find_by_email(email)
      else
        User.last
      end
    end
  end
end
