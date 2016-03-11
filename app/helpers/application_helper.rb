module ApplicationHelper
  def foundation_flash_class(level)
    case level.to_sym
      when :notice  then "callout success"
      when :alert   then "callout alert"
    end
  end
end
