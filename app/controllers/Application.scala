package controllers

import play.api._
import play.api.mvc._

object Application extends Controller {

  def index = Action {
    val hoge = new Hoge()
    Ok(views.html.index.render(hoge))
  }

}

class Hoge {
  val title: String = "HogeTitle"
}