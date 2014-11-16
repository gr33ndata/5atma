class KhatamatController < ApplicationController

    def index
        @khatamat = Khatma.all
    end

    def show
        puts "params:" 
        puts params
        @khatma = Khatma.find(params[:id])
        @myself = current_user
        @progress = 0
        @khatma.chapters.each do |chapter|
            if chapter.users.size != 0
                @progress += 1
            end
        end
        @progress_percent = @progress * 100 / 30
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
        if current_user == @my_khatma.user
            @my_khatma.destroy
            redirect_to action: "index"
        else
            redirect_to action: "index"
        end    
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
        if current_user
            ch_id = params[:ch_id]
            kh_id = params[:kh_id]
            @my_chapter = Chapter.where(name: ch_id, khatma_id: kh_id)
            current_user.chapters.delete(@my_chapter)
            current_user.save
            redirect_to action: "show", id: kh_id
        else
            redirect_to action: "show", id: kh_id
        end
    end

end
