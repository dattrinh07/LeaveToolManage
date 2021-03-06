class EmployeesController < ActionController::Base

  layout 'application'

  before_action :authenticate_user!

  load_and_authorize_resource :employee, class: "User"



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
    authorize! :edit, @employee

  end

  def create
    authorize! :create, @employee
    @employee = User.new(employee_params)

    @employee.add_role params[:role]

    if @employee.save
      flash[:success] = 'Employee Was Created!'
      redirect_to employees_path
    else
      render 'new'
    end
  end

  def update
    authorize! :update, @employee
    @employee = User.find(params[:id])
    # @employee.remove_role @employee.roles.pluck(:name).join(",")
    # @employee.add_role params[:role]
    # params[:employee][:role_ids] ||= []

    if @employee.update(employee_params)
      flash[:success] = 'Employee was updated!'
      redirect_to employees_path
    else
      render 'edit'
    end

  end

  def destroy
    @employee = User.find(params[:id])
    if @employee.destroy
      flash[:success] = 'Employee was destroyed!'
    else
      flash[:warning] = 'Cannot destroy this employee...'
    end
    redirect_to employees_path
    authorize! :destroy, @employee
  end

  def update_password
    @employee = User.find(current_user.id)
  end

  def change_password
    @employee = User.find(current_user.id)

    if @employee.update_with_password(pd_params)
      sign_in @employee, :bypass => true
      redirect_to root_path
    else
      render "update_password"
    end

  end
  
  private
  def employee_params
    params.require(:employee).permit(:email,:password,:full_name, :role, :address, :phone, :skype)
  end

  def pd_params
    params.require(:employee).permit(:current_password, :password, :password_confirmation)
  end

end
