class LeaveReflex < ApplicationReflex
  def start_date(first)
    @start_date = first
    morph "#foo", @start_date
  end

  def end_date(last)
    @end_date = last
    morph "#foo", @end_date
  end
end
