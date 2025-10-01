# frozen_string_literal: true
require 'redmine'

Redmine::Plugin.register :redmine_wktime_lite do
  name        'ERPmine Time & Expense Lite'
  author      'Gonzalo Rojas - KaiZen2B'
  description 'Only Time (wktime) & Expense (wkexpense) screens'
  version     '0.1.0'

  # Declaramos un módulo de proyecto simple con permisos básicos.
  project_module :wktime_lite do
    permission :view_time_sheets,    { wktime: [:index] }
    permission :manage_time_sheets,  { wktime: [:new, :create, :edit, :update, :destroy, :submit, :approve, :reject, :export] }

    permission :view_expense_sheets,   { wkexpense: [:index] }
    permission :manage_expense_sheets, { wkexpense: [:new, :create, :edit, :update, :destroy, :submit, :approve, :reject, :export] }
  end

  # Menú superior (no de proyecto) para evitar dependencias de project_id.
  menu :top_menu, :wktime,    { controller: 'wktime',    action: 'index'    },
      caption: 'Time & Expense', if: Proc.new { User.current.logged? }

  # Si querés un acceso directo a Expenses, descomentá esta línea:
  # menu :top_menu, :wkexpense, { controller: 'wkexpense', action: 'index' },
  #     caption: 'Expenses', if: Proc.new { User.current.logged? }
end
