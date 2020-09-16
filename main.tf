locals {
  h          = var.panel_height
  w          = var.panel_width
  columns    = (24 / local.w)
  all_panels = concat(var.load_balancer_panels[*], var.rds_panels[*], var.redis_panels[*], var.es_panels[*], var.ecs_panels[*])
  panels = [
    for count, panel in local.all_panels :
    merge(panel,
      { id = count },
      { gridPos = {
        h = local.h
        w = local.w
        x = (count % local.columns) * local.w
        y = ceil((count + 1) / local.columns) * local.h - local.h }
      }
    )
  ]

  ##############################################
  # Grafana Application Stack Dashboard Template
  ##############################################
  dashboard = {
    __inputs = [{
      name        = "DATA_SOURCE"
      label       = "DataSource"
      value       = var.datasource
      description = ""
      type        = "datasource"
      pluginId    = "cloudwatch"
      pluginName  = "CloudWatch"
    }],
    __requires = [
      { type = "datasource", id = "cloudwatch", name = "CloudWatch", version = "1.0.0" },
      { type = "grafana", id = "grafana", name = "Grafana", version = "6.7.2" },
      { type = "panel", id = "graph", name = "Graph", version = "" },
      { type = "panel", id = "text", name = "text", version = "" }
    ],
    annotations = {
      list = [
        { builtIn = 1, datasource = "-- Grafana --", enable = true, hide = true, iconColor = "rgba(0, 211, 255, 1)", name = "Annotations & Alerts", type = "dashboard" }
      ]
    },
    description   = "Application Stack for ${title(var.application_name)} ${title(var.environment_name)} Environment",
    editable      = true
    gnetId        = null
    graphTooltip  = 0
    id            = null
    links         = []
    panels        = local.panels
    refresh       = "5m"
    schemaVersion = 22,
    style         = "dark"
    tags          = []
    templating = {
      list = [
        {
          auto       = true
          auto_count = 30
          auto_min   = "1m"
          current    = { selected = false, text = "auto", value = "auto" }
          hide       = 2
          label      = "Bar Graph Interval"
          name       = "bar_graph_interval"
          options = [
            { selected = true, text = "auto", value = "$__auto_interval_bar_graph_interval" },
            { selected = false, text = "1m", value = "1m" },
            { selected = false, text = "5m", value = "5m" },
            { selected = false, text = "10m", value = "10m" },
            { selected = false, text = "30m", value = "30m" },
            { selected = false, text = "1h", value = "1h" },
            { selected = false, text = "6h", value = "6h" },
            { selected = false, text = "12h", value = "12h" },
            { selected = false, text = "1d", value = "1d" },
            { selected = false, text = "7d", value = "7d" },
            { selected = false, text = "14d", value = "14d" },
            { selected = false, text = "30d", value = "30d" }
          ],
          query       = "1m,10m,30m,1h,6h,12h,1d,7d,14d,30d",
          refresh     = 2,
          skipUrlSync = false,
          type        = "interval"
        },
        {
          current = {
            selected = true,
            text     = var.datasource,
            value    = var.datasource
          }
          hide        = 2,
          includeAll  = false
          label       = "DataSource"
          multi       = false
          name        = "datasource"
          options     = []
          query       = "cloudwatch"
          refresh     = 1
          regex       = ""
          skipUrlSync = false
          type        = "datasource"
        }
      ]
    }
    time = { from = "now-7d", to = "now" }
    timepicker = {
      refresh_intervals = ["5s", "10s", "30s", "1m", "5m", "15m", "30m", "1h", "2h", "1d"]
      time_options      = ["5m", "15m", "1h", "6h", "12h", "24h", "2d", "7d", "30d"]
    }
    timezone  = "browser",
    title     = "${title(var.application_name)} ${title(var.environment_name)} Application Stack"
    uid       = var.uid
    variables = { list = [] }
    version   = 1
  }

  json_map = jsonencode(local.dashboard)
}
