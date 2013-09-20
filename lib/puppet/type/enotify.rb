#
# Simple module for logging messages on the client-side
#
Puppet::Type.newtype(:enotify) do
  @doc = "Sends an arbitrary message to the agent run-time log."

  newproperty(:message) do
    desc "The message to be sent to the log."
    def sync
      if resource[:withpath]
        msg = send(resource[:loglevel], self.should)
      else
        msg = Puppet.send(resource[:loglevel], self.should)
      end

      if resource[:state] == :failed
        fail(msg)
      end

      msg
    end

    def retrieve
      :absent
    end

    def insync?(is)
      if resource[:state] == :unchanged or (resource[:debugonly] and !Puppet[:debug])
        true
      else
        false
      end
    end

    defaultto { resource[:name] }
  end

  newparam(:withpath) do
    desc "Whether to show the full object path. Defaults to false."
    defaultto false

    newvalues(:true, :false)
  end

  newparam(:name) do
    desc "An arbitrary tag for your own reference; the name of the message."
    isnamevar
  end

  newparam(:debugonly) do
    desc "Only simulate changed or failed events if this is a debug run. Defaults to false"
    defaultto false

    newvalues(:true, :false)
  end

  newparam(:state) do
    desc "The state that should be simulated by the declared enotify resource. Defaults to 'changed'."
    defaultto :changed

    newvalues(:unchanged, :changed, :failed)
  end
end
