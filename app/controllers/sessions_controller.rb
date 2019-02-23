class SessionsController < ApplicationController

  def new
  end

  def create
    # user = User.find_by(params[:email])#うまくいくがsessionを使えていない
    
    user = User.find_by(email: params[:session][:email].downcase)#テキストログインできない不具合
    # User.find_by(email: "aaaa@mail.com")
    #エラー内容-User.find_by...の中身を確認
    #User Load (0.2ms)  SELECT  "users".* FROM "users" WHERE "users"."email" = ? LIMIT ?  [["email", "aaaa@gmail.com"], ["LIMIT", 1]]
    #=> nil
    
    #user = User.find_by(params[:id])#testログインできることを確認
    #user = User.find_by(params[:session][:email])#エラー
    #binding.pry
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'メールアドレスとパスワードの情報が一致しませんでした。'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end