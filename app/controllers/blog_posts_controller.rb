class BlogPostsController < ApplicationController
    def index
        @blog_posts = BlogPost.all
    # instance variable -> rails makes this available when rendering out variable
    # local variable would be cleared out after index is finished exceuting
    end

    def show
        @blog_post = BlogPost.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        redirect_to root_path
    end

    def new
        @blog_post = BlogPost.new
    end 

    def create
        @blog_post = BlogPost.new(blog_post_params)
        if @blog_post.save
            redirect_to @blog_post
        else render :new, status: :unprocessable_entity
        end 
    end

    private

    def blog_post_params
        params.require(:blog_post).permit(:title, :body)
    end 
end

# inherit from application controller, which is an action controller, 
# gives all the features we need to proccess http requests and params we may need