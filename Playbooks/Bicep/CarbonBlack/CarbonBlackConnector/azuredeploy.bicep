metadata comments = 'This connector used to perform different actions on alerts , device and threats using CarbonBlack cloud endpoint API.'
metadata author = 'Dharma Reddy,CarbonBlack'

@description('Name of the carbon black connector')
param CustomConnectorName string = 'CarbonBlackCloudConnector'

@description('enter the carbonblack baseURL (ex: https://defense.conferdeploy.net)')
param Service_EndPoint string = 'https://defense.conferdeploy.net'
param workspace string

resource CustomConnector 'Microsoft.Web/customApis@2016-06-01' = {
  name: CustomConnectorName
  location: resourceGroup().location
  properties: {
    connectionParameters: {
      api_key: {
        type: 'securestring'
        uiDefinition: {
          displayName: 'API Key'
          description: 'The API Key for this api'
          tooltip: 'Provide your API Key'
          constraints: {
            tabIndex: 2
            clearText: false
            required: 'true'
          }
        }
      }
    }
    backendService: {
      serviceUrl: Service_EndPoint
    }
    description: 'The Carbon Black Cloud is a cloud-native endpoint protection platform (EPP) that provides what you need to secure your endpoints using a single, lightweight agent and an easy-to-use console.'
    displayName: CustomConnectorName
    iconUri: 'data:image/jpeg;base64,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'
    swagger: {
      swagger: '2.0'
      info: {
        title: 'Default title'
        description: 'The Carbon Black Cloud is a cloud-native endpoint protection platform (EPP) that provides what you need to secure your endpoints using a single, lightweight agent and an easy-to-use console.'
        version: '1.0'
      }
      host: 'defense.conferdeploy.net'
      basePath: '/'
      schemes: [
        'https'
      ]
      consumes: []
      produces: []
      paths: {
        '/appservices/v6/orgs/{org_key}/devices/_search': {
          post: {
            responses: {
              default: {
                description: 'default'
                schema: {
                  type: 'object'
                  properties: {
                    results: {
                      type: 'array'
                      items: {
                        type: 'object'
                        properties: {
                          activation_code: {
                            type: 'string'
                            description: 'Device activation code to register the sensor with a specific org'
                            title: ''
                          }
                          activation_code_expiry_time: {
                            type: 'string'
                            description: 'When the activation code expires and cannot be used to register a device'
                            title: ''
                          }
                          ad_group_id: {
                            type: 'integer'
                            format: 'int32'
                            description: 'Active Directory group ID to match'
                            title: ''
                          }
                          appliance_name: {
                            type: 'string'
                            description: 'Name of the Appliance the Virtual Machine (VM) is associated with'
                            title: ''
                          }
                          appliance_uuid: {
                            type: 'string'
                            description: 'The Uuid of the appliance the VM is associated with'
                            title: ''
                          }
                          av_ave_version: {
                            type: 'string'
                            description: 'AVE version (part of AV Version)'
                            title: ''
                          }
                          av_engine: {
                            type: 'string'
                            description: 'Current anti virus (AV) version'
                            title: ''
                          }
                          av_last_scan_time: {
                            type: 'string'
                            description: 'The last time a local scan completed'
                            title: ''
                          }
                          av_master: {
                            type: 'boolean'
                            description: 'Whether the device is an AV Master'
                            title: ''
                            enum: [
                              ''
                              'true'
                              'false'
                            ]
                          }
                          av_pack_version: {
                            type: 'string'
                            description: 'Pack version (part of AV Version)'
                            title: ''
                          }
                          av_product_version: {
                            type: 'string'
                            description: 'Product version (part of AV Version)'
                            title: ''
                          }
                          av_status: {
                            type: 'array'
                            items: {
                              type: 'string'
                            }
                            description: 'av_status'
                          }
                          av_update_servers: {
                            type: 'string'
                            description: 'A list of device’s AV servers'
                            title: ''
                          }
                          av_vdf_version: {
                            type: 'string'
                            description: 'VDF version (part of AV Version)'
                            title: ''
                          }
                          cluster_name: {
                            type: 'string'
                            description: 'Name of the cluster. A cluster is a group of hosts'
                            title: ''
                          }
                          current_sensor_policy_name: {
                            type: 'string'
                            description: 'The name of the policy currently configured on the sensor'
                            title: ''
                          }
                          datacenter_name: {
                            type: 'string'
                            description: 'Name of the underlying datacenter. The datacenter managed object provides the interface to the common container object for hosts, virtual machines, networks, and datastores'
                            title: ''
                          }
                          deployment_type: {
                            type: 'string'
                            description: 'The device’s deployment type, a classification that is determined by its lifecycle management policy'
                            title: ''
                          }
                          deregistered_time: {
                            type: 'string'
                            description: 'Time when the deregister request was received'
                            title: ''
                          }
                          device_meta_data_item_list: {
                            type: 'array'
                            items: {
                              type: 'object'
                              properties: {
                                key_name: {
                                  type: 'string'
                                  description: 'key_name'
                                }
                                key_value: {
                                  type: 'string'
                                  description: 'key_value'
                                }
                                position: {
                                  type: 'integer'
                                  format: 'int32'
                                  description: 'position'
                                }
                              }
                            }
                            description: 'device_meta_data_item_list'
                          }
                          device_owner_id: {
                            type: 'integer'
                            format: 'int32'
                            description: 'The identifier for the device owner associated with the device'
                            title: ''
                          }
                          email: {
                            type: 'string'
                            description: 'The email address for the device owner'
                            title: ''
                          }
                          esx_host_name: {
                            type: 'string'
                            description: 'Name of the ESX host on which the VM is deployed'
                            title: ''
                          }
                          esx_host_uuid: {
                            type: 'string'
                            description: 'Uuid of the ESX host on which VM is deployed'
                            title: ''
                          }
                          first_name: {
                            type: 'string'
                            description: 'The first name of the device owner'
                            title: ''
                          }
                          id: {
                            type: 'integer'
                            format: 'int32'
                            description: 'id'
                          }
                          last_contact_time: {
                            type: 'string'
                            description: 'Last contact time'
                            title: ''
                          }
                          last_device_policy_changed_time: {
                            type: 'string'
                            description: 'The last time the sensor changed from one policy to another'
                            title: ''
                          }
                          last_device_policy_requested_time: {
                            type: 'string'
                            description: 'The last time the sensor checked for changes to the policy'
                            title: ''
                          }
                          last_external_ip_address: {
                            type: 'string'
                            description: 'The last IP address of the device according to the Carbon Black Cloud; can differ from last_internal_ip_address due to network proxy or NAT'
                            title: ''
                          }
                          last_internal_ip_address: {
                            type: 'string'
                            description: 'The last IP address of the device reported by the sensor'
                            title: ''
                          }
                          last_location: {
                            type: 'string'
                            description: 'The device’s current location relative to the organization’s network, based on the current IP address and the device’s registered DNS domain suffix'
                            title: ''
                          }
                          last_name: {
                            type: 'string'
                            description: 'The last name of the device owner'
                            title: ''
                          }
                          last_policy_updated_time: {
                            type: 'string'
                            description: 'The last time the current policy received an update'
                            title: ''
                          }
                          last_reported_time: {
                            type: 'string'
                            description: 'The last time when the Carbon Black Cloud received one or more events reported by the sensor'
                            title: ''
                          }
                          last_reset_time: {
                            type: 'string'
                            description: 'The last time the device was reset'
                            title: ''
                          }
                          last_shutdown_time: {
                            type: 'string'
                            description: 'The last time the device was shutdown'
                            title: ''
                          }
                          linux_kernel_version: {
                            type: 'string'
                            description: 'Not implemented'
                            title: ''
                          }
                          login_user_name: {
                            type: 'string'
                            description: 'The last user logged in on the device'
                            title: ''
                          }
                          mac_address: {
                            type: 'string'
                            description: 'The media access control (MAC) address for the device’s primary interface'
                            title: ''
                          }
                          middle_name: {
                            type: 'string'
                            description: 'The middle name of the device owner'
                            title: ''
                          }
                          name: {
                            type: 'string'
                            description: 'name'
                          }
                          organization_id: {
                            type: 'integer'
                            format: 'int32'
                            description: 'Organization identifier'
                            title: ''
                          }
                          organization_name: {
                            type: 'string'
                            description: 'Organization name'
                            title: ''
                          }
                          os: {
                            type: 'string'
                            description: 'Operating System'
                            title: ''
                          }
                          os_version: {
                            type: 'string'
                            description: 'The operating system and version of the endpoint'
                            title: ''
                          }
                          passive_mode: {
                            type: 'boolean'
                            description: 'Whether the device is in bypass'
                            title: ''
                            enum: [
                              ''
                              'true'
                              'false'
                            ]
                          }
                          policy_id: {
                            type: 'integer'
                            format: 'int32'
                            description: 'The policy identifier assigned to the device'
                            title: ''
                          }
                          policy_name: {
                            type: 'string'
                            description: 'The policy name assigned to the device. May not match'
                            title: ''
                          }
                          policy_override: {
                            type: 'boolean'
                            description: 'Whether the policy was manually assigned to override mass sensor management'
                            title: ''
                            enum: [
                              ''
                              'true'
                              'false'
                            ]
                          }
                          quarantined: {
                            type: 'boolean'
                            description: 'An indicator that the device is in quarantine mode'
                            title: ''
                            enum: [
                              ''
                              'true'
                              'false'
                            ]
                          }
                          registered_time: {
                            type: 'string'
                            description: 'When the device was registered with the Carbon Black Cloud'
                            title: ''
                          }
                          scan_last_action_time: {
                            type: 'string'
                            description: 'The last time the background scan was started or stopped'
                            title: ''
                          }
                          scan_last_complete_time: {
                            type: 'string'
                            description: 'The time the last background scan completed'
                            title: ''
                          }
                          scan_status: {
                            type: 'string'
                            description: 'The status of the background scan'
                            title: ''
                          }
                          sensor_kit_type: {
                            type: 'string'
                            description: 'The type of sensor installed on the device'
                            title: ''
                          }
                          sensor_out_of_date: {
                            type: 'boolean'
                            description: 'Whether there is a new version available to be installed'
                            title: ''
                            enum: [
                              ''
                              'true'
                              'false'
                            ]
                          }
                          sensor_pending_update: {
                            type: 'boolean'
                            description: 'Whether the sensor is marked by the Sensor Update Service for a sensor upgrade'
                            title: ''
                            enum: [
                              ''
                              'true'
                              'false'
                            ]
                          }
                          sensor_states: {
                            type: 'array'
                            items: {
                              type: 'string'
                            }
                            description: 'sensor_states'
                          }
                          sensor_version: {
                            type: 'string'
                            description: 'The version of the installed sensor'
                            title: ''
                          }
                          status: {
                            type: 'string'
                            description: 'The status of the device'
                            title: ''
                          }
                          target_priority: {
                            type: 'string'
                            description: 'The “Target value” configured in the policy assigned to the sensor'
                            title: ''
                          }
                          uninstall_code: {
                            type: 'string'
                            description: 'The code to enter when uninstalling the sensor'
                            title: ''
                          }
                          vcenter_host_url: {
                            type: 'string'
                            description: 'vcenter_host_url'
                          }
                          vcenter_name: {
                            type: 'string'
                            description: 'Name of the vcenter the vm is associated with'
                            title: ''
                          }
                          vcenter_uuid: {
                            type: 'string'
                            description: '128-bit SMBIOS UUID of a vcenter represented as a hexadecimal string'
                            title: ''
                          }
                          vdi_base_device: {
                            type: 'string'
                            description: 'The identifier of the device from which this device was cloned/re-registered'
                            title: ''
                          }
                          virtual_machine: {
                            type: 'boolean'
                            description: 'Whether this device is a Virtual Machine (VMware AppDefense integration)'
                            title: ''
                            enum: [
                              ''
                              'true'
                              'false'
                            ]
                          }
                          virtualization_provider: {
                            type: 'string'
                            description: 'Name of the VM Virtualization Provider'
                            title: ''
                          }
                          vm_ip: {
                            type: 'string'
                            description: 'VM’s Ip'
                            title: ''
                          }
                          vm_name: {
                            type: 'string'
                            description: 'Name of the Virtual Machine that the sensor is deployed on'
                            title: ''
                          }
                          vm_uuid: {
                            type: 'string'
                            description: '128-bit SMBIOS UUID of a virtual machine represented as a hexadecimal string'
                            title: ''
                          }
                          vulnerability_score: {
                            type: 'integer'
                            format: 'int32'
                            description: 'A score from 0 to 100 indicating the workload’s level of vulnerability with 100 being highly vulnerable'
                            title: ''
                          }
                          vulnerability_severity: {
                            type: 'string'
                            description: 'The severity level indicating the workload’s vulnerability'
                            title: ''
                          }
                          windows_platform: {
                            type: 'string'
                            description: 'Deprecated for os_version'
                            title: ''
                          }
                        }
                      }
                      description: 'results'
                    }
                    num_found: {
                      type: 'integer'
                      format: 'int32'
                      description: 'Number of records found'
                      title: ''
                    }
                  }
                }
              }
            }
            summary: 'Search devices'
            description: 'Search devices in your organization'
            operationId: 'SearchdevicesInOrganization'
            'x-ms-visibility': 'important'
            parameters: [
              {
                name: 'org_key'
                in: 'path'
                required: true
                type: 'string'
                description: 'Organization Key'
                'x-ms-visibility': 'important'
              }
              {
                name: 'Content-Type'
                in: 'header'
                required: true
                type: 'string'
                default: 'application/json'
                'x-ms-visibility': 'important'
              }
              {
                name: 'body'
                in: 'body'
                required: true
                schema: {
                  type: 'object'
                  properties: {
                    criteria: {
                      type: 'object'
                      properties: {
                        status: {
                          type: 'array'
                          items: {
                            type: 'string'
                            description: 'Device statuses to match'
                            title: ''
                            enum: [
                              'PENDING'
                              'REGISTERED'
                              'UNINSTALLED'
                              'DEREGISTERED'
                              'ACTIVE'
                              'INACTIVE'
                              'ERROR'
                              'ALL'
                              'BYPASS_ON'
                              'BYPASS'
                              'QUARANTINE'
                              'SENSOR_OUTOFDATE'
                              'DELETED'
                              'LIVE'
                            ]
                          }
                          description: 'status'
                        }
                        os: {
                          type: 'array'
                          items: {
                            type: 'string'
                            description: 'Operating System'
                            title: ''
                          }
                          description: 'os'
                        }
                        last_contact_time: {
                          type: 'object'
                          properties: {
                            end: {
                              type: 'string'
                              description: 'Last contact time end [ start and end are specified as ISO-8601 strings ]'
                              title: ''
                            }
                            range: {
                              type: 'string'
                              description: 'Last contact time range range can be either all (to indicate all time), or a specific duration specified as -[quantity][unit], where unit is one of'
                              title: ''
                              enum: [
                                's'
                                'm'
                                'h'
                                'd'
                                'w'
                                'y'
                              ]
                            }
                            start: {
                              type: 'string'
                              description: 'Last contact time start [ start and end are specified as ISO-8601 strings ]'
                              title: ''
                            }
                          }
                          description: 'last_contact_time'
                        }
                        ad_group_id: {
                          type: 'array'
                          items: {
                            type: 'string'
                            description: 'Active Directory group ID to match'
                            title: ''
                          }
                          description: 'Active Directory group ID to match'
                        }
                        policy_id: {
                          type: 'array'
                          items: {
                            type: 'string'
                            description: 'Carbon Black Cloud Policy ID to match'
                            title: ''
                          }
                          description: 'Carbon Black Cloud Policy ID to match'
                        }
                        id: {
                          type: 'array'
                          items: {
                            type: 'string'
                          }
                          description: 'id'
                        }
                        target_priority: {
                          type: 'array'
                          items: {
                            type: 'string'
                            description: 'Device target priorities to match'
                            title: ''
                            enum: [
                              'LOW'
                              'MEDIUM'
                              'HIGH'
                              'MISSION_CRITICAL'
                            ]
                          }
                          description: 'target_priority'
                        }
                        deployment_type: {
                          type: 'array'
                          items: {
                            type: 'string'
                            description: 'The device’s deployment type, a classification that is determined by its lifecycle management policy'
                            title: ''
                          }
                          description: 'The device’s deployment type, a classification that is determined by its lifecycle management policy'
                        }
                        vm_uuid: {
                          type: 'array'
                          items: {
                            type: 'string'
                            description: '128-bit SMBIOS UUID of a virtual machine represented as a hexadecimal string'
                            title: ''
                          }
                          description: '128-bit SMBIOS UUID of a virtual machine represented as a hexadecimal string'
                        }
                        vcenter_uuid: {
                          type: 'array'
                          items: {
                            type: 'string'
                            description: '128-bit SMBIOS UUID of a vcenter represented as a hexadecimal string'
                            title: ''
                          }
                          description: '128-bit SMBIOS UUID of a vcenter represented as a hexadecimal string'
                        }
                      }
                      description: 'criteria'
                    }
                    exclusions: {
                      type: 'object'
                      properties: {
                        sensor_version: {
                          type: 'array'
                          items: {
                            type: 'string'
                            description: 'The version of the installed sensor [ Format: #.#.#.# ]'
                            title: ''
                          }
                          description: 'The version of the installed sensor [ Format: #.#.#.# ]'
                        }
                      }
                      description: 'exclusions'
                    }
                    query: {
                      type: 'string'
                      description: 'query format [ fieldname : value OR/AND fieldname : value ]'
                      title: ''
                    }
                    sort: {
                      type: 'array'
                      items: {
                        type: 'object'
                        properties: {
                          field: {
                            type: 'string'
                            description: 'Field to sort results by'
                            title: ''
                          }
                          order: {
                            type: 'string'
                            description: 'Sort order'
                            title: ''
                          }
                        }
                      }
                      description: 'sort'
                    }
                    rows: {
                      type: 'string'
                      description: 'Maximum number of rows to return'
                      title: ''
                    }
                    start: {
                      type: 'string'
                      description: 'What row to begin returning results from'
                      title: ''
                    }
                  }
                }
              }
            ]
          }
        }
        '/appservices/v6/orgs/{org_key}/device_actions': {
          post: {
            responses: {
              default: {
                description: 'default'
                schema: {
                  type: 'string'
                }
              }
            }
            summary: 'Take action on device'
            description: 'device actions'
            operationId: 'DeviceActions'
            parameters: [
              {
                name: 'org_key'
                in: 'path'
                required: true
                type: 'string'
                description: 'Organization Key'
              }
              {
                name: 'Content-Type'
                in: 'header'
                required: true
                type: 'string'
                'x-ms-visibility': 'important'
                default: 'application/json'
              }
              {
                name: 'body'
                in: 'body'
                required: true
                schema: {
                  type: 'object'
                  properties: {
                    action_type: {
                      type: 'string'
                      description: 'Action to perform on selected devices'
                      title: ''
                      enum: [
                        'QUARANTINE'
                        'UPDATE_POLICY'
                      ]
                      default: 'QUARANTINE'
                    }
                    device_id: {
                      type: 'array'
                      items: {
                        type: 'string'
                        description: 'List of devices to perform action on'
                        title: ''
                        default: 'List of devices to perform action on'
                      }
                      description: 'device_id'
                    }
                    options: {
                      type: 'object'
                      properties: {
                        toggle: {
                          type: 'string'
                          description: 'Determines whether to enable or disable the action [ Required if action_type is set to QUARANTINE, BYPASS, or BACKGROUND_SCAN ]'
                          title: ''
                          'x-ms-visibility': 'advanced'
                          enum: [
                            'ON'
                            'OFF'
                          ]
                        }
                        policy_id: {
                          type: 'string'
                          description: 'Devices will be updated to this policy ID [ Required if action_type is set to UPDATE_POLICY ]'
                          title: ''
                        }
                      }
                      description: 'options'
                    }
                  }
                  required: [
                    'action_type'
                    'device_id'
                  ]
                }
              }
            ]
          }
        }
        '/api/investigate/v1/orgs/{org_key}/processes/search_suggestions': {
          get: {
            responses: {
              default: {
                description: 'default'
                schema: {
                  type: 'object'
                  properties: {
                    suggestions: {
                      type: 'array'
                      items: {
                        type: 'object'
                        properties: {
                          term: {
                            type: 'string'
                            description: 'term'
                          }
                          weight: {
                            type: 'integer'
                            format: 'int32'
                            description: 'weight'
                          }
                          required_skus_all: {
                            type: 'array'
                            items: {}
                            description: 'required_skus_all'
                          }
                          required_skus_some: {
                            type: 'array'
                            items: {
                              type: 'string'
                            }
                            description: 'required_skus_some'
                          }
                        }
                      }
                      description: 'suggestions'
                    }
                  }
                }
              }
            }
            summary: 'Search for processes by query'
            description: 'Search for processes by query'
            operationId: 'ProcessSearchSuggestionsByQuery'
            parameters: [
              {
                name: 'org_key'
                in: 'path'
                required: true
                type: 'string'
                description: 'Organization Key'
              }
              {
                name: 'suggest.q'
                in: 'query'
                required: true
                type: 'string'
                default: 'process_cmd'
                description: 'Query to generate suggestions for'
              }
              {
                name: 'suggest.count'
                in: 'query'
                required: false
                type: 'integer'
                default: 50
                description: 'Number of suggestions to return'
              }
            ]
          }
        }
        '/api/investigate/v2/orgs/{org_key}/processes/detail_jobs/{job_id}/results': {
          get: {
            responses: {
              default: {
                description: 'default'
                schema: {
                  type: 'object'
                  properties: {
                    completed: {
                      type: 'integer'
                      format: 'int32'
                      description: 'completed'
                    }
                    contacted: {
                      type: 'integer'
                      format: 'int32'
                      description: 'contacted'
                    }
                    num_available: {
                      type: 'integer'
                      format: 'int32'
                      description: 'num_available'
                    }
                    num_found: {
                      type: 'integer'
                      format: 'int32'
                      description: 'num_found'
                    }
                    results: {
                      type: 'array'
                      items: {
                        type: 'object'
                        properties: {
                          backend_timestamp: {
                            type: 'string'
                            description: 'backend_timestamp'
                          }
                          childproc_count: {
                            type: 'integer'
                            format: 'int32'
                            description: 'childproc_count'
                          }
                          crossproc_count: {
                            type: 'integer'
                            format: 'int32'
                            description: 'crossproc_count'
                          }
                          device_external_ip: {
                            type: 'string'
                            description: 'device_external_ip'
                          }
                          device_group_id: {
                            type: 'integer'
                            format: 'int32'
                            description: 'device_group_id'
                          }
                          device_id: {
                            type: 'integer'
                            format: 'int32'
                            description: 'device_id'
                          }
                          device_location: {
                            type: 'string'
                            description: 'device_location'
                          }
                          device_name: {
                            type: 'string'
                            description: 'device_name'
                          }
                          device_os: {
                            type: 'string'
                            description: 'device_os'
                          }
                          device_os_version: {
                            type: 'string'
                            description: 'device_os_version'
                          }
                          device_policy: {
                            type: 'string'
                            description: 'device_policy'
                          }
                          device_policy_id: {
                            type: 'integer'
                            format: 'int32'
                            description: 'device_policy_id'
                          }
                          device_target_priority: {
                            type: 'string'
                            description: 'device_target_priority'
                          }
                          device_timestamp: {
                            type: 'string'
                            description: 'device_timestamp'
                          }
                          document_guid: {
                            type: 'string'
                            description: 'document_guid'
                          }
                          filemod_count: {
                            type: 'integer'
                            format: 'int32'
                            description: 'filemod_count'
                          }
                          ingress_time: {
                            type: 'integer'
                            format: 'int32'
                            description: 'ingress_time'
                          }
                          modload_count: {
                            type: 'integer'
                            format: 'int32'
                            description: 'modload_count'
                          }
                          netconn_count: {
                            type: 'integer'
                            format: 'int32'
                            description: 'netconn_count'
                          }
                          org_id: {
                            type: 'string'
                            description: 'org_id'
                          }
                          parent_effective_reputation: {
                            type: 'string'
                            description: 'parent_effective_reputation'
                          }
                          parent_guid: {
                            type: 'string'
                            description: 'parent_guid'
                          }
                          parent_hash: {
                            type: 'array'
                            items: {
                              type: 'string'
                            }
                            description: 'parent_hash'
                          }
                          parent_name: {
                            type: 'string'
                            description: 'parent_name'
                          }
                          parent_pid: {
                            type: 'integer'
                            format: 'int32'
                            description: 'parent_pid'
                          }
                          parent_publisher_state: {
                            type: 'array'
                            items: {
                              type: 'string'
                            }
                            description: 'parent_publisher_state'
                          }
                          parent_reputation: {
                            type: 'string'
                            description: 'parent_reputation'
                          }
                          process_cmdline: {
                            type: 'array'
                            items: {
                              type: 'string'
                            }
                            description: 'process_cmdline'
                          }
                          process_cmdline_length: {
                            type: 'array'
                            items: {
                              type: 'integer'
                              format: 'int32'
                            }
                            description: 'process_cmdline_length'
                          }
                          process_effective_reputation: {
                            type: 'string'
                            description: 'process_effective_reputation'
                          }
                          process_guid: {
                            type: 'string'
                            description: 'process_guid'
                          }
                          process_hash: {
                            type: 'array'
                            items: {
                              type: 'string'
                            }
                            description: 'process_hash'
                          }
                          process_name: {
                            type: 'string'
                            description: 'process_name'
                          }
                          process_pid: {
                            type: 'array'
                            items: {
                              type: 'integer'
                              format: 'int32'
                            }
                            description: 'process_pid'
                          }
                          process_publisher_state: {
                            type: 'array'
                            items: {
                              type: 'string'
                            }
                            description: 'process_publisher_state'
                          }
                          process_reputation: {
                            type: 'string'
                            description: 'process_reputation'
                          }
                          process_sha256: {
                            type: 'string'
                            description: 'process_sha256'
                          }
                          process_start_time: {
                            type: 'string'
                            description: 'process_start_time'
                          }
                          process_username: {
                            type: 'array'
                            items: {
                              type: 'string'
                            }
                            description: 'process_username'
                          }
                          regmod_count: {
                            type: 'integer'
                            format: 'int32'
                            description: 'regmod_count'
                          }
                          scriptload_count: {
                            type: 'integer'
                            format: 'int32'
                            description: 'scriptload_count'
                          }
                        }
                      }
                      description: 'results'
                    }
                  }
                }
              }
            }
            summary: 'Search for a process metadata by process GUID'
            description: 'Retrieves the process detail results for a given job_id. Confirm the search has completed by verifying that “contacted” equals “completed”'
            operationId: 'ProcessMetadataSearchByProcessGUID'
            parameters: [
              {
                name: 'org_key'
                in: 'path'
                required: true
                type: 'string'
                description: 'Organization Key'
              }
              {
                name: 'job_id'
                in: 'path'
                required: true
                type: 'string'
                description: 'Job Id'
              }
            ]
          }
        }
        '/api/investigate/v2/orgs/{org_key}/events/{process_guid}/_search': {
          post: {
            responses: {
              default: {
                description: 'default'
                schema: {
                  type: 'object'
                  properties: {
                    results: {
                      type: 'array'
                      items: {
                        type: 'object'
                        properties: {
                          backend_timestamp: {
                            type: 'string'
                            description: 'backend_timestamp'
                          }
                          created_timestamp: {
                            type: 'string'
                            description: 'created_timestamp'
                          }
                          enriched: {
                            type: 'boolean'
                            description: 'enriched'
                          }
                          enriched_event_type: {
                            type: 'string'
                            description: 'enriched_event_type'
                          }
                          event_description: {
                            type: 'string'
                            description: 'event_description'
                          }
                          event_guid: {
                            type: 'string'
                            description: 'event_guid'
                          }
                          event_hash: {
                            type: 'string'
                            description: 'event_hash'
                          }
                          event_timestamp: {
                            type: 'string'
                            description: 'event_timestamp'
                          }
                          event_type: {
                            type: 'string'
                            description: 'event_type'
                          }
                          legacy: {
                            type: 'boolean'
                            description: 'legacy'
                          }
                          legacy_description: {
                            type: 'string'
                            description: 'legacy_description'
                          }
                          netconn_action: {
                            type: 'string'
                            description: 'netconn_action'
                          }
                          netconn_inbound: {
                            type: 'boolean'
                            description: 'netconn_inbound'
                          }
                          netconn_local_ipv4: {
                            type: 'integer'
                            format: 'int32'
                            description: 'netconn_local_ipv4'
                          }
                          netconn_local_port: {
                            type: 'integer'
                            format: 'int32'
                            description: 'netconn_local_port'
                          }
                          netconn_protocol: {
                            type: 'string'
                            description: 'netconn_protocol'
                          }
                          netconn_remote_ipv4: {
                            type: 'integer'
                            format: 'int32'
                            description: 'netconn_remote_ipv4'
                          }
                          netconn_remote_port: {
                            type: 'integer'
                            format: 'int32'
                            description: 'netconn_remote_port'
                          }
                          process_guid: {
                            type: 'string'
                            description: 'process_guid'
                          }
                          process_pid: {
                            type: 'integer'
                            format: 'int32'
                            description: 'process_pid'
                          }
                        }
                      }
                      description: 'results'
                    }
                    num_found: {
                      type: 'integer'
                      format: 'int32'
                      description: 'num_found'
                    }
                    num_available: {
                      type: 'integer'
                      format: 'int32'
                      description: 'num_available'
                    }
                    total_segments: {
                      type: 'integer'
                      format: 'int32'
                      description: 'total_segments'
                    }
                    processed_segments: {
                      type: 'integer'
                      format: 'int32'
                      description: 'processed_segments'
                    }
                  }
                }
              }
            }
            summary: 'Search for processes events by process GUID'
            description: 'Fetch the events associated with a given process. These events are often more complete than the enriched events but, unlike the enriched event searches, must be limited to one process at a time.'
            operationId: 'SearchForProcessEventsByProcessGUID'
            parameters: [
              {
                name: 'org_key'
                in: 'path'
                required: true
                type: 'string'
                description: 'Organization Key'
              }
              {
                name: 'process_guid'
                in: 'path'
                required: true
                type: 'string'
                description: 'Process GUID'
              }
              {
                name: 'body'
                in: 'body'
                required: true
                schema: {
                  type: 'object'
                  properties: {
                    criteria: {
                      type: 'string'
                      description: 'Criteria is an object that represents values that must be in the results. Either query or criteria/exclusion must be included'
                      title: ''
                    }
                    exclusions: {
                      type: 'string'
                      description: 'Exclusions is a map that represents values that must not be in the results. Either query or criteria/exclusion must be included'
                      title: ''
                    }
                    fields: {
                      type: 'array'
                      items: {
                        type: 'string'
                        description: 'A list of fields to include in the results, specify * to return all the default fields and add additional fields that are not returned by default'
                        title: ''
                      }
                      description: 'fields'
                    }
                    query: {
                      type: 'string'
                      description: 'Query in lucene syntax and/or including value searches. Either query or criteria/exclusion must be included'
                      title: ''
                    }
                    rows: {
                      type: 'string'
                      description: 'Number of rows to request, can be paginated'
                      title: ''
                    }
                    sort: {
                      type: 'array'
                      items: {
                        type: 'object'
                        properties: {
                          field: {
                            type: 'string'
                            description: 'field'
                          }
                          order: {
                            type: 'string'
                            description: 'Sorting Order [ asc , desc ]'
                            title: ''
                            enum: [
                              'asc'
                              'desc'
                            ]
                          }
                        }
                      }
                      description: 'sort'
                    }
                    start: {
                      type: 'string'
                      description: 'First row to use for pagination'
                      title: ''
                    }
                    time_range: {
                      type: 'object'
                      properties: {
                        end: {
                          type: 'string'
                          description: 'Time Range end [ ISO 8601 timestamp ]'
                          title: ''
                        }
                        start: {
                          type: 'string'
                          description: 'Time Range start [ ISO 8601 timestamp ]'
                          title: ''
                        }
                        window: {
                          type: 'string'
                          description: 'Window will take priority over start and end if provided'
                          title: ''
                        }
                      }
                      description: 'time_range'
                    }
                  }
                }
              }
            ]
          }
        }
        '/appservices/v6/orgs/{org_key}/alerts/{alert_id}/workflow': {
          post: {
            responses: {
              default: {
                description: 'default'
                schema: {
                  type: 'object'
                  properties: {
                    state: {
                      type: 'string'
                      description: 'Workflow state'
                      title: ''
                    }
                    remediation: {
                      type: 'string'
                      description: 'Description or justification for the change'
                      title: ''
                    }
                    last_update_time: {
                      type: 'string'
                      description: 'The last time the alert was updated'
                      title: ''
                    }
                    comment: {
                      type: 'string'
                      description: 'Comment to include with the operation'
                      title: ''
                    }
                    changed_by: {
                      type: 'string'
                      description: 'changed_by'
                      title: ''
                    }
                  }
                }
              }
            }
            summary: 'Dismiss an alert'
            description: 'Update the alert with the current state of the remediation'
            operationId: 'DismissAnAlert'
            'x-ms-visibility': 'important'
            parameters: [
              {
                name: 'org_key'
                in: 'path'
                required: true
                type: 'string'
                description: 'Organization Key'
                'x-ms-visibility': 'important'
              }
              {
                name: 'alert_id'
                in: 'path'
                required: true
                type: 'string'
                description: 'Alert Id'
                'x-ms-visibility': 'important'
              }
              {
                name: 'body'
                in: 'body'
                required: true
                schema: {
                  type: 'object'
                  properties: {
                    state: {
                      type: 'string'
                      description: 'Workflow state to set'
                      title: ''
                      'x-ms-visibility': 'important'
                      default: 'DISMISSED'
                      enum: [
                        'DISMISSED'
                        'OPEN'
                      ]
                    }
                    comment: {
                      type: 'string'
                      description: 'Comment to include with the operation'
                      title: ''
                      'x-ms-visibility': 'important'
                    }
                    remediation_state: {
                      type: 'string'
                      description: 'Description or justification for the change'
                      title: ''
                      'x-ms-visibility': 'important'
                    }
                  }
                  'x-ms-visibility': 'important'
                  required: [
                    'state'
                    'comment'
                    'remediation_state'
                  ]
                }
                'x-ms-visibility': 'important'
              }
            ]
          }
        }
        '/appservices/v6/orgs/{org_key}/alerts/workflow/_criteria': {}
        '/appservices/v6/orgs/{org_key}/alerts/{alert_id}/notes': {
          post: {
            responses: {
              default: {
                description: 'default'
                schema: {
                  type: 'object'
                  properties: {
                    author: {
                      type: 'string'
                      description: 'author'
                    }
                    create_time: {
                      type: 'string'
                      description: 'create_time'
                    }
                    id: {
                      type: 'string'
                      description: 'id'
                    }
                    note: {
                      type: 'string'
                      description: 'note'
                    }
                  }
                }
              }
            }
            summary: 'Add a note to an alert'
            description: 'Add a comment to provide context, in the case someone looks in the CBC console.'
            operationId: 'AddNoteToAnAlert'
            'x-ms-visibility': 'important'
            parameters: [
              {
                name: 'org_key'
                in: 'path'
                required: true
                type: 'string'
                description: 'Organization Key'
                'x-ms-visibility': 'important'
              }
              {
                name: 'alert_id'
                in: 'path'
                required: true
                type: 'string'
                description: 'Alert Id'
                'x-ms-visibility': 'important'
              }
              {
                name: 'body'
                in: 'body'
                required: true
                schema: {
                  type: 'object'
                  properties: {
                    note: {
                      type: 'string'
                      description: 'A segment of text to attach to the specified Alert [ Max: 255 characters ]'
                      title: ''
                      'x-ms-visibility': 'important'
                    }
                  }
                  required: [
                    'note'
                  ]
                }
              }
            ]
          }
        }
      }
      definitions: {}
      parameters: {}
      responses: {}
      securityDefinitions: {
        api_key: {
          type: 'apiKey'
          in: 'header'
          name: 'X-Auth-Token'
        }
      }
      security: []
      tags: []
    }
  }
}
