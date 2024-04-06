module Api
  module V1
    class ArticlesController < ApplicationController

      before_action :set_article, only: [:show]

      def index
        articles = Article.all
        render json: {
          status: "SUCCESS",
          message: "Loaded articles",
          data: articles
        }
      end
      
      def show
        render json: {
          status: "SUCCESS",
          message: "Loaded article",
          data: @article
        }
      end

      private

      def set_article
        @article = Article.find(params[:id])
      end
    end
  end
end
