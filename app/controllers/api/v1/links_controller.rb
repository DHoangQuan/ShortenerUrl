# frozen_string_literal: true

module Api
  module V1
    # user controller
    class LinksController < ApplicationController
      before_action :authenticate_user!

      def index
        list_links = Link.all.paginate(page: params[:page], per_page: 10)

        options = {}
        options[:meta] = {
          current_page: list_links.current_page,
          total_pages: list_links.total_pages,
          total_count: list_links.count
        }
        render json: LinkSerializer.new(list_links, options).serialized_json
      end

      def show
        link = Link.find(params[:id])

        render json: LinkSerializer.new(link).serialized_json
      rescue StandardError, AnotherError => e
        title = 'Not Found'
        render_error(404, title, e) and return
      end

      def create
        status = LinkOperations::CreateLink.new(params, current_user.id).execute

        return render json: { status: 200, message: 'create succeed' } if status[:status] == 200

        render json: {
          status: :error,
          message: 'failed'
        }
      end

      def update
        link = Link.find(params[:id])
        status = LinkOperations::UpdateLink.new(params, link).execute

        return render json: { status: 200, message: 'update succeed' } if status[:status] == 200

        render json: {
          status: :error,
          message: 'failed'
        }
      end

      def stat
        LinkStatService.new(params).execute
      end
    end
  end
end
