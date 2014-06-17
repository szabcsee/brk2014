class StaticPagesController < ApplicationController
  def home
    @menu_enabled = true
  end

  def programs
    @menu_enabled = true
    @programs = Program.all
  end

  def information
    @menu_enabled = true
  end

  def traveling_teachers
    @menu_enabled = true
  end
end
