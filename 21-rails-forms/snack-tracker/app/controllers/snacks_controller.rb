class SnacksController < ApplicationController

    before_action :find_snack, only: [:show, :edit, :update, :delete]
    def home 
    end

    def about
        render :about_page
    end

    def index
        if params["bad_for_you"]
            @snacks = Snack.all.select {|snack| snack.high_calorie? }
        else
            @snacks = Snack.all
        end
    end

    def show
    end

    def new
        @snack = Snack.new
    end

    def create
        # name = params[:snack][:name]
        # calories = params[:snack][:calories]
        # deliciousness = params[:snack][:deliciousness]
        snack = Snack.create(snack_params)
        redirect_to snack_path(snack.id)
    end

    def edit
    end

    def update
        @snack.update(snack_params)
        redirect_to snack_path(@snack)
    end

    def destroy
        @snack.destroy 
        redirect_to snacks_path
    end

    private

    def find_snack
        @snack = Snack.find(params[:id])

    end
    def snack_params
        params.require(:snack).permit(:name, :calories, :deliciousness)
    end
end
