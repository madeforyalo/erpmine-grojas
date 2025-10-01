# frozen_string_literal: true

class WktimeController < ApplicationController
  # Versión Lite: solo Time & Expense.
  # Evitamos includes de módulos no T&E.
  include WktimeHelper if defined?(WktimeHelper)

  before_action :require_login

  # Listado/landing de timesheets
  def index
    # Renderiza la vista si existe; si no, responde 200 vacío.
    if lookup_context.template_exists?('wktime/index', [], true)
      render 'wktime/index'
    else
      head :ok
    end
  end

  # Acciones mínimas vacías para no romper rutas existentes
  def new; end
  def edit; end
  def create; head :ok; end
  def update; head :ok; end
  def destroy; head :ok; end
  def submit; head :ok; end
  def approve; head :ok; end
  def reject; head :ok; end
  def export; head :ok; end
end
