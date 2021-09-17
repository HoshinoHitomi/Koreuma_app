module ApplicationHelper
  def status_color(v)
    if v == 'on_sale'
      "status_onsale"
    elsif v == 'finish'
      "status_finish"
    else
      "status_stop"
    end
  end
end
