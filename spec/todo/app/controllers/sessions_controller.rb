class SessionsController < Matrack::BaseController
  def index
  end

  def create
    if params["password"] == params["confpswd"]
      user = User.new
      user.firstname = params["firstname"]
      user.lastname = params["lastname"]
      user.email = params["email"]
      user.password = params["password"]
      if user.save
        session[:email] = user.email
        redirect_to "/todolist/new"
      end
      return @msg = "User not created"
    end
    @msg = "Password mismatch"
    render :index
  end

  def login
    email = params["user_email"]
    password = authenticate(params["user_password"])
    if User.find_cols(email: email, password: password)
      session[:email] = email
      redirect_to "/tasks"
    else
      @msg = "Invalid credentials"
      render :index
    end
  end

  def logout
    session.clear
    redirect_to "/"
  end

end