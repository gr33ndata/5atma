class ChaptersController < ApplicationController

    def adduser
        puts params[:id]
        redirect_to root_url
    end

    def deluser
        puts params[:id]
        redirect_to root_url
    end
end
