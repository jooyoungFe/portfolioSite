module ApplicationHelper
  def nav_link(label, path)
    class_names = ["nav__link"]
    class_names << "is-active" if current_page?(path)

    link_to label, path, class: class_names.join(" ")
  end
end
