#
# Simple module for logging messages on the client-side
#

module Puppet
  newtype(:enotify) do
    @doc = "Sends an arbitrary message to the agent run-time log."

    newproperty(:message) do
      desc "The message to be sent to the log."
      def sync
        case @resource["withpath"]
        when :true
          send(@resource[:loglevel], self.should)
        else
          Puppet.send(@resource[:loglevel], self.should)
          Puppet.debug("Debug from the notify: "  + self.should)
        end
        return
      end

      def retrieve
        :absent
      end

      def insync?(is)
        state = false if @resource[:state] != :unchanged else true

        #false
      end

      defaultto { @resource[:name] }
    end

    newparam(:withpath) do
      desc "Whether to show the full object path. Defaults to false."
      defaultto :false

      newvalues(:true, :false)
    end

    newparam(:name) do
      desc "An arbitrary tag for your own reference; the name of the message."
      isnamevar
    end

    newparam(:debugonly) do
      desc "Only process change of failed events if this is a debug run. Defaults to false"
      defaultto :false

      newvalues(:true, :false)
    end

    newparam(:state) do
      desc "The state that should be simulated by the declared resource. Defaults to changed."
      defaultto :changed

      newvalues(:unchanged, :changed, :failed)
    end
  end
end
