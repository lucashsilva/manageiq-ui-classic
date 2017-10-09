class PhysicalServerController < ApplicationController
  include Mixins::GenericListMixin
  include Mixins::GenericShowMixin
  include Mixins::GenericSessionMixin
  include Mixins::MoreShowActions

  before_action :check_privileges
  before_action :session_data
  after_action :cleanup_action
  after_action :set_session_data

  def self.table_name
    @table_name ||= "physical_servers"
  end

  def session_data
    @title  = _("Physical Servers")
    @layout = "physical_server"
    @lastaction = session[:physical_server_lastaction]
  end

  def set_session_data
    session[:layout] = @layout
    session[:physical_server_lastaction] = @lastaction
  end

  def show_list
    # Disable the cache to prevent a caching problem that occurs when
    # pressing the browser's back arrow button to return to the show_list
    # page while on the Physical Server's show page. Disabling the cache
    # causes the page and its session variables to actually be reloaded.
    disable_client_cache

    process_show_list
  end

  def textual_group_list
    [
      %i(properties networks relationships power_management assets firmware_details network_adapters),
    ]
  end
  helper_method :textual_group_list

  def button
    if params[:pressed] == "#{table_name.singularize}_timeline"
      @showtype = "timeline"
      @record = find_record_with_rbac(ManageIQ::Providers::PhysicalInfraManager::PhysicalServer, params[:id])
      @timeline = @timeline_filter = true
      @lastaction = "show_timeline"
      tl_build_timeline
      drop_breadcrumb(:name => _("Timelines"), :url => show_link(@record, :refresh => "n", :display => "timeline"))
      session[:tl_record_id] = @record.id
      javascript_redirect(polymorphic_path(@record, :display => 'timeline').sub!('.', '/show/'))
    end
  end
end
