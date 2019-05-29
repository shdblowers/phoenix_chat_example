defmodule Chat do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    topologies = [
      k8s_chat: [
        strategy: Elixir.Cluster.Strategy.Kubernetes.DNS,
          config: [
            service: "chat-nodes",
            application_name: "chat"
          ]
        ]
      ]

    children = [
      {Cluster.Supervisor, [topologies, [name: Chat.ClusterSupervisor]]},
      supervisor(Chat.Endpoint, [])
    ]

    opts = [strategy: :one_for_one, name: Chat.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    Chat.Endpoint.config_change(changed, removed)
    :ok
  end
end
