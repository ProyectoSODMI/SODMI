class AlumnosController < ApplicationController
  # GET /alumnos
  # GET /alumnos.json
  def index
    redirect_to "/404.html"  
  end

  # GET /alumnos/1
  # GET /alumnos/1.json
  def show
    @alumno = Alumno.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @alumno }
    end
  end

  # GET /alumnos/new
  # GET /alumnos/new.json
  def new
    @alumno = Alumno.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @alumno }
    end
  end

  # GET /alumnos/1/edit
  def edit
    @alumno = Alumno.find(params[:id])
  end

  # POST /alumnos
  # POST /alumnos.json
  def create
   @alumno = Alumno.new(params[:alumno])
  
  
    respond_to do |format|
      if @alumno.save
        
        #Encviamos correo de Bienvenida
        UsuarioMailer.registration_confirmation(@alumno).deliver
        #Ingresa el alumno a la pagina
        sign_in @alumno
        format.html { redirect_to @alumno
            flash[:success] = "Bienvenido a SODMI! "+ @alumno.nombre+ " se ha guardado tu registro con exito "
             }
        format.json { render json: alumno, status: :created, location: alumno }
      else
        format.html { render action: "new" }
        format.json { render json: alumno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /alumnos/1
  # PUT /alumnos/1.json
  def update
    @alumno = Alumno.find(params[:id])

    respond_to do |format|
      if @alumno.update_attributes(params[:alumno])
        sign_in @alumno
        format.html { redirect_to @alumno
          flash[:success] = " Se han guardado los cambios con exito " }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: alumno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alumnos/1
  # DELETE /alumnos/1.json
  def destroy
    alumno = Alumno.find(params[:id])
    alumno.destroy

    respond_to do |format|
      format.html { redirect_to alumnos_url }
      format.json { head :no_content }
    end
  end
end
