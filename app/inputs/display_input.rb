class DisplayInput < SimpleForm::Inputs::Base
  def input
    # label code from https://github.com/plataformatec/simple_form/blob/master/lib/simple_form/components/labels.rb#28
    template.content_tag(:p, object.send(attribute_name).blank? ? 'blank' : object.send(attribute_name), :class => object.send(attribute_name).blank? ? 'blank form-control-static' : 'form-control-static')
  end

  def additional_classes
    @additional_classes ||= [input_type].compact # original is `[input_type, required_class, readonly_class, disabled_class].compact`
  end
end