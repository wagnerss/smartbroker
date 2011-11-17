class BranchesController < ApplicationController
      
  def index
    if params[:search].blank?
      @branches = Branch.all.page(params[:page]).asc(:code)
    else
      @branches = Branch.fulltext_search(params[:search])
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @branches }
    end
  end

  def show
    @branch = Branch.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @branch }
    end
  end

  def new
    @branch = Branch.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @branch }
    end
  end

  def edit
    @branch = Branch.find(params[:id])
  end

  def create
    @branch = Branch.new(params[:branch])
    respond_to do |format|
      if @branch.save
        format.html { redirect_to @branch, notice: 'Branch was successfully created.' }
        format.json { render json: @branch, status: :created, location: @branch }
      else
        format.html { render action: "new" }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @branch = Branch.find(params[:id])
    respond_to do |format|
      if @branch.update_attributes(params[:branch])
        format.html { redirect_to @branch, notice: 'Branch was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @branch = Branch.find(params[:id])
    @branch.destroy
    respond_to do |format|
      format.html { redirect_to branches_url }
      format.json { head :ok }
    end
  end
end
