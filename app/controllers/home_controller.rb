class HomeController < ApplicationController
    def index
        
    end

    def search  
        if params[:search].blank?  
            redirect_to(root_path, notice: 'Domain unavailable') and return  
          else
            @parameter = params[:search].downcase  
            @results = Domain.all.where("lower(name) LIKE :search", search: @parameter)  
            format.html { redirect_to @domain, notice: 'Domain was successfully created.' }
            
          end  
        @results = Domain.all.where("lower(name) LIKE :search", search: @parameter) 
        @results.inspect
    end
    
end
