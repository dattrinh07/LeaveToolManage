class EmployeesController < ActionController::Base


  layout 'application'
  def index
    @employees = User.all
  end

  def show
    @employee = User.find(params[:id])
  end

  def new
    @employee = User.new
  end

  def edit
    @employee = User.find(params[:id])
  end

  def create
    @employee = User.new(employee_params)

    if @employee.save
      redirect_to @employee
    else
      render 'new'
    end
  end

  def update
    @employee = User.find(params[:id])

    if @employee.update(employee_params)
      redirect_to @employee
    else
      render 'edit'
    end
  end

  def destroy
    @employee = User.find(params[:id])
    @employee.destroy

    redirect_to employees_path
  end

  private
  def employee_params
    params.require(:employee).permit(:email, :password,:password_confirmation, :full_name, :address, :phone, :skype)
  end
end
