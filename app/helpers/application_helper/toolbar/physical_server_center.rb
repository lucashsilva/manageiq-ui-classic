class ApplicationHelper::Toolbar::PhysicalServerCenter < ApplicationHelper::Toolbar::Basic
  button_group(
    'physical_server_operations',
    [
      select(
        :physical_server_power_choice,
        'fa fa-power-off fa-lg',
        N_('Power Functions'),
        N_('Power'),
        :items => [
          button(
            :physical_server_power_on,
            nil,
            N_('Power on the server'),
            N_('Power On'),
            :image   => "power_on",
            :data    => {'function'      => 'sendDataWithRx',
                         'function-data' => '{"type": "power_on", "controller": "physicalServerToolbarController"}'},
            :confirm => N_("Power on the server?"),
            :options => {:feature => :power_on}
          ),
          button(
            :physical_server_power_off,
            nil,
            N_('Power off the server'),
            N_('Power Off'),
            :image   => "power_off",
            :data    => {'function'      => 'sendDataWithRx',
                         'function-data' => '{"type": "power_off", "controller": "physicalServerToolbarController"}'},
            :confirm => N_("Power off the server?"),
            :options => {:feature => :power_off}
          ),
          button(
            :physical_server_restart,
            nil,
            N_('Restart the server'),
            N_('Restart'),
            :image   => "power_reset",
            :data    => {'function'      => 'sendDataWithRx',
                         'function-data' => '{"type": "restart", "controller": "physicalServerToolbarController"}'},
            :confirm => N_("Restart the server?"),
            :options => {:feature => :restart}
          ),
        ]
      ),
      select(
        :physical_server_identify_choice,
        nil,
        N_('Identify LED Operations'),
        N_('Identify'),
        :items => [
          button(
            :physical_server_blink_loc_led,
            nil,
            N_('Blink the Identify LED'),
            N_('Blink LED'),
            :image   => "blank_button",
            :data    => {'function'      => 'sendDataWithRx',
                         'function-data' => '{"type": "blink_loc_led", "controller": "physicalServerToolbarController"}'},
            :confirm => N_("Blink the Identify LED?"),
            :options => {:feature => :blink_loc_led}
          ),
          button(
            :physical_server_turn_on_loc_led,
            nil,
            N_('Turn on the Idenfity LED'),
            N_('Turn On LED'),
            :image   => "blank_button",
            :data    => {'function'      => 'sendDataWithRx',
                         'function-data' => '{"type": "turn_on_loc_led", "controller": "physicalServerToolbarController"}'},
            :confirm => N_("Turn on the Identify LED?"),
            :options => {:feature => :turn_on_loc_led}
          ),
          button(
            :physical_server_turn_off_loc_led,
            nil,
            N_('Turn off the Identify LED'),
            N_('Turn Off LED'),
            :image   => "blank_button",
            :data    => {'function'      => 'sendDataWithRx',
                         'function-data' => '{"type": "turn_off_loc_led", "controller": "physicalServerToolbarController"}'},
            :confirm => N_("Turn off the Identify LED?"),
            :options => {:feature => :turn_off_loc_led}
          ),
        ]
      ),
    ]
  )

   button_group('physical_server_monitoring', [
    select(
      :physical_server_monitoring_choice,
      'ff ff-monitoring fa-lg',
      t = N_('Monitoring'),
      t,
      :items => [
        button(
          :ems_physical_infra_timeline,
          'ff ff-timeline fa-lg',
          N_('Show Timelines for this Physical Server'),
          N_('Timelines'),
          :klass     => ApplicationHelper::Button::PhysicalServerTimeline,
          :url_parms => "?display=timeline"),
      ]
    ),
  ])
end
