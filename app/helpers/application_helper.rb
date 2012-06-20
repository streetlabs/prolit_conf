module ApplicationHelper
  def yield_for(content_sym, default)
    output = content_for(content_sym)
    output = default if output.blank?
    output
  end

  def yuva_helper(attendee, role)
    role.is_a? ? Attendee::ROLES[role.first] : nil
  end
end
