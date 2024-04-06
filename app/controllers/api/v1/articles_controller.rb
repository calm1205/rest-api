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

      def create
        article = Article.new(article_params)

        if article.save!
          render json: {
            status: "SUCCESS",
            message: "Saved article",
            data: article
          }
        else
          render json: {
            status: "ERROR",
            message: "Article not saved",
            data: article.errors
          }
        end
      end

      def update
        article = Article.find(params[:id])

        if article.update!(article_params)
          render json: {
            status: "SUCCESS",
            message: "Updated article",
            data: article
          }
        else
          render json: {
            status: "ERROR",
            message: "Article not updated",
            data: article.errors
          }
        end
      end

      private

      def set_article
        @article = Article.find(params[:id])
      end

      def article_params
        params.require(:article).permit(:title, :body)
      end
    end
  end
end
