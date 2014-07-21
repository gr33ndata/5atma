class KhatamatController < ApplicationController

    def index
        @my_khatamat = Khatma.all
    end

    def show
        puts "params:" 
        puts params
        @my_khatma = Khatma.find(params[:id])
    end

    def new
    end

    def create
        if current_user
            @description = params[:description]
            @owner = current_user
            @my_khatma = Khatma.new
            @my_khatma.description = @description 
            @my_khatma.user_id = @owner
            @my_khatma.save
            # Create Khatma Chapters
            for i in 1..30
                @new_chapter = Chapter.new
                @new_chapter.khatma = @my_khatma
                @new_chapter.name = "#{i}"
                @new_chapter.save
            end
            redirect_to action: "index"
        else
            render action: "new"
        end
    end

    def destroy
        @my_khatma = Khatma.find(params[:id])
        @my_khatma.destroy
        redirect_to action: "index"
    end

    def add_user
        if current_user
            ch_id = params[:ch_id]
            kh_id = params[:kh_id]
            @my_chapter = Chapter.where(name: ch_id, khatma_id: kh_id)
            current_user.chapters << @my_chapter
            current_user.save
            #@my_chapter.users.create(:user => current_user)
            #@my_chapter.save 
            redirect_to action: "show", id: kh_id
        else
            redirect_to action: "show", id: kh_id
        end
    end

    def del_user
        ch_id = params[:ch_id]
        kh_id = params[:kh_id]
        redirect_to action: "show", id: kh_id
    end

end
