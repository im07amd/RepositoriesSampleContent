metadata comments = 'This PaloAlto custom connector uses PAN-OS API to perform different actions on the PAN-OS VM'
metadata author = 'Sindhu Talluri,PAN-OS'

@description('Name of the PaloAlto Connector')
param PaloAlto_PAN_OS_CustomConnector_Name string = 'PAN-OSCustomConnector'

@description('enter the PaloAlto endpoint (ex: https://{yourPaloAltoDomain})')
param Service_EndPoint string = 'https://www.yourPaloAltoDomain.com'
param workspace string

resource PaloAlto_PAN_OS_CustomConnector 'Microsoft.Web/customApis@2016-06-01' = {
  name: PaloAlto_PAN_OS_CustomConnector_Name
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
    brandColor: '#FFFFFF'
    description: 'This is the PaloAlto Custom Connector'
    displayName: PaloAlto_PAN_OS_CustomConnector_Name
    iconUri: 'data:image/png;base64,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'
    swagger: {
      swagger: '2.0'
      info: {
        title: 'Default title'
        description: ''
        version: '1.0'
      }
      host: '$substring([parameters(\'Service EndPoint\')],8 )'
      basePath: '/'
      schemes: [
        'https'
      ]
      consumes: []
      produces: []
      paths: {
        '/restapi/v10.0/Policies/SecurityRules': {
          get: {
            responses: {
              default: {
                description: 'default'
                schema: {
                  type: 'object'
                  properties: {
                    '@status': {
                      type: 'string'
                      description: 'defines the status'
                      title: '@status'
                    }
                    '@code': {
                      type: 'string'
                      description: 'defines the status code'
                      title: '@code'
                    }
                    result: {
                      type: 'object'
                      properties: {
                        '@total-count': {
                          type: 'string'
                          description: 'the total count of security policy rules in PAN-OS VM'
                          title: '@total-count'
                        }
                        '@count': {
                          type: 'string'
                          description: 'the count of security policy rules in PAN-OS VM'
                          title: '@count'
                        }
                        entry: {
                          type: 'array'
                          items: {
                            type: 'object'
                            properties: {
                              '@name': {
                                type: 'string'
                                description: 'the name of the security policy rule'
                                title: '@name'
                              }
                              '@uuid': {
                                type: 'string'
                                description: 'the unique id of the security policy rule'
                                title: '@uuid'
                              }
                              '@location': {
                                type: 'string'
                                description: 'the location where the security policy rule is being located at. default value is "vsys"'
                                title: '@location'
                              }
                              '@vsys': {
                                type: 'string'
                                description: 'the vsys name of the location. default value is "vsys1"'
                                title: '@vsys'
                              }
                              action: {
                                type: 'string'
                                description: 'action allowed on security policy rule.'
                                title: 'action'
                              }
                              application: {
                                type: 'object'
                                properties: {
                                  member: {
                                    type: 'array'
                                    items: {
                                      type: 'string'
                                    }
                                    description: 'member'
                                  }
                                }
                                description: 'application'
                              }
                              category: {
                                type: 'object'
                                properties: {
                                  member: {
                                    type: 'array'
                                    items: {
                                      type: 'string'
                                    }
                                    description: 'member'
                                  }
                                }
                                description: 'category'
                              }
                              destination: {
                                type: 'object'
                                properties: {
                                  member: {
                                    type: 'array'
                                    items: {
                                      type: 'string'
                                    }
                                    description: 'member'
                                  }
                                }
                                description: 'destination'
                              }
                              from: {
                                type: 'object'
                                properties: {
                                  member: {
                                    type: 'array'
                                    items: {
                                      type: 'string'
                                    }
                                    description: 'member'
                                  }
                                }
                                description: 'from'
                              }
                              'hip-profiles': {
                                type: 'object'
                                properties: {
                                  member: {
                                    type: 'array'
                                    items: {
                                      type: 'string'
                                    }
                                    description: 'member'
                                  }
                                }
                                description: 'hip-profiles'
                              }
                              service: {
                                type: 'object'
                                properties: {
                                  member: {
                                    type: 'array'
                                    items: {
                                      type: 'string'
                                    }
                                    description: 'member'
                                  }
                                }
                                description: 'service'
                              }
                              source: {
                                type: 'object'
                                properties: {
                                  member: {
                                    type: 'array'
                                    items: {
                                      type: 'string'
                                    }
                                    description: 'member'
                                  }
                                }
                                description: 'source'
                              }
                              'source-user': {
                                type: 'object'
                                properties: {
                                  member: {
                                    type: 'array'
                                    items: {
                                      type: 'string'
                                    }
                                    description: 'member'
                                  }
                                }
                                description: 'source-user'
                              }
                              to: {
                                type: 'object'
                                properties: {
                                  member: {
                                    type: 'array'
                                    items: {
                                      type: 'string'
                                    }
                                    description: 'member'
                                  }
                                }
                                description: 'to'
                              }
                              'source-hip': {
                                type: 'object'
                                properties: {
                                  member: {
                                    type: 'array'
                                    items: {
                                      type: 'string'
                                    }
                                    description: 'member'
                                  }
                                }
                                description: 'source-hip'
                              }
                              'destination-hip': {
                                type: 'object'
                                properties: {
                                  member: {
                                    type: 'array'
                                    items: {
                                      type: 'string'
                                    }
                                    description: 'member'
                                  }
                                }
                                description: 'destination-hip'
                              }
                            }
                          }
                          description: 'entry'
                        }
                      }
                      description: 'result'
                    }
                  }
                }
              }
            }
            summary: 'List security rules'
            description: 'List of all the security rules'
            operationId: 'Listsecurityrules'
            'x-ms-visibility': 'important'
            parameters: [
              {
                name: 'location'
                in: 'query'
                required: true
                type: 'string'
                default: 'vsys'
                description: 'Enter the location'
              }
              {
                name: 'vsys'
                in: 'query'
                required: true
                type: 'string'
                default: 'vsys1'
                description: 'Enter the vsys location name'
              }
              {
                name: 'name'
                in: 'query'
                required: false
                type: 'string'
                description: 'filter the security rule by name'
                'x-ms-summary': 'name'
              }
            ]
          }
          post: {
            responses: {
              default: {
                description: 'default'
                schema: {
                  type: 'object'
                  properties: {
                    '@status': {
                      type: 'string'
                      description: 'status if success or failure'
                      title: '@status'
                    }
                    '@code': {
                      type: 'string'
                      description: 'statuscode'
                      title: '@code'
                    }
                    msg: {
                      type: 'string'
                      description: 'status message'
                      title: 'msg'
                    }
                  }
                }
              }
            }
            summary: 'Create a security policy rule'
            description: 'Creates a new policy rule'
            operationId: 'Createsecuritypolicyrule'
            'x-ms-visibility': 'important'
            parameters: [
              {
                name: 'location'
                in: 'query'
                required: true
                type: 'string'
                default: 'vsys'
                description: 'Enter the location'
              }
              {
                name: 'vsys'
                in: 'query'
                required: true
                type: 'string'
                default: 'vsys1'
                description: 'Enter the vsys location name'
              }
              {
                name: 'name'
                in: 'query'
                required: true
                type: 'string'
                description: 'Enter the name of security policy rule'
              }
              {
                name: 'body'
                in: 'body'
                required: true
                schema: {
                  type: 'object'
                  properties: {
                    entry: {
                      type: 'object'
                      properties: {
                        '@name': {
                          type: 'string'
                          description: 'Enter the name of security policy rule'
                          title: 'name'
                        }
                        to: {
                          type: 'object'
                          properties: {
                            member: {
                              type: 'string'
                              description: 'Enter the to member, Array of strings'
                              title: 'to member'
                              default: 'any'
                            }
                          }
                          description: 'to'
                          required: [
                            'member'
                          ]
                        }
                        from: {
                          type: 'object'
                          properties: {
                            member: {
                              type: 'string'
                              description: 'Enter the from member,Array of strings'
                              title: 'from member'
                              default: 'any'
                            }
                          }
                          description: 'from'
                          required: [
                            'member'
                          ]
                        }
                        'source-user': {
                          type: 'object'
                          properties: {
                            member: {
                              type: 'string'
                              description: 'Enter the source-user member, Array of strings'
                              title: 'source-user member'
                              default: 'any'
                            }
                          }
                          description: 'source-user'
                        }
                        application: {
                          type: 'object'
                          properties: {
                            member: {
                              type: 'string'
                              description: 'Enter the application member, Array of strings'
                              title: 'application member'
                              default: 'any'
                            }
                          }
                          description: 'application'
                          required: [
                            'member'
                          ]
                        }
                        service: {
                          type: 'object'
                          properties: {
                            member: {
                              type: 'string'
                              description: 'Enter the service member, Array of strings'
                              title: 'service member'
                              default: 'any'
                            }
                          }
                          description: 'service'
                          required: [
                            'member'
                          ]
                        }
                        'hip-profiles': {
                          type: 'object'
                          properties: {
                            member: {
                              type: 'string'
                              description: 'Enter the hip-profiles member, Array of strings'
                              title: 'hip-profiles member'
                              default: 'any'
                            }
                          }
                          description: 'hip-profiles'
                        }
                        action: {
                          type: 'string'
                          description: 'enter the action ex: allow'
                          enum: [
                            'deny'
                            'allow'
                            'drop'
                            'reset-client'
                            'reset-server'
                            'reset-both'
                          ]
                          title: 'action'
                          default: 'allow'
                        }
                        category: {
                          type: 'object'
                          properties: {
                            member: {
                              type: 'string'
                              description: 'Enter the category member, Array of strings'
                              title: 'category member'
                              default: 'any'
                            }
                          }
                          description: 'category'
                        }
                        source: {
                          type: 'object'
                          properties: {
                            member: {
                              type: 'string'
                              description: 'Enter the source member, Array of strings for ex:["url.com","panos.com"]'
                              title: 'source member'
                              default: 'any'
                            }
                          }
                          description: 'source'
                          required: [
                            'member'
                          ]
                        }
                        destination: {
                          type: 'object'
                          properties: {
                            member: {
                              type: 'string'
                              description: 'Enter the source member, Array of strings for ex:["1.1.1.1","2.2.2.2"]'
                              title: 'destination member'
                              default: 'any'
                            }
                          }
                          description: 'destination'
                          required: [
                            'member'
                          ]
                        }
                      }
                      description: 'entry'
                      required: [
                        '@name'
                        'action'
                        'application'
                        'category'
                        'destination'
                        'from'
                        'hip-profiles'
                        'service'
                        'source'
                        'to'
                      ]
                    }
                  }
                  required: [
                    'entry'
                  ]
                }
              }
            ]
          }
          put: {
            responses: {
              default: {
                description: 'default'
                schema: {
                  type: 'object'
                  properties: {
                    '@status': {
                      type: 'string'
                      description: 'status if success or failure'
                      title: '@status'
                    }
                    '@code': {
                      type: 'string'
                      description: 'status code'
                      title: '@code'
                    }
                    msg: {
                      type: 'string'
                      description: 'the status msg if success or failure'
                      title: 'msg'
                    }
                  }
                }
              }
            }
            parameters: [
              {
                name: 'location'
                in: 'query'
                required: true
                type: 'string'
                default: 'vsys'
                description: 'Enter the location'
              }
              {
                name: 'vsys'
                in: 'query'
                required: true
                type: 'string'
                default: 'vsys1'
                description: 'Enter the vsys location name'
              }
              {
                name: 'name'
                in: 'query'
                required: true
                type: 'string'
                description: 'Enter the name of security policy rule'
              }
              {
                name: 'body'
                in: 'body'
                required: true
                schema: {
                  type: 'object'
                  properties: {
                    entry: {
                      type: 'object'
                      properties: {
                        '@name': {
                          type: 'string'
                          description: 'Enter the name of security policy rule'
                          title: 'name'
                        }
                        to: {
                          type: 'object'
                          properties: {
                            member: {
                              type: 'string'
                              description: 'Enter the to member, Array of strings'
                              title: 'to member'
                              default: 'any'
                            }
                          }
                          description: 'to'
                          required: [
                            'member'
                          ]
                        }
                        from: {
                          type: 'object'
                          properties: {
                            member: {
                              type: 'string'
                              description: 'Enter the from member,Array of strings'
                              title: 'from member'
                              default: 'any'
                            }
                          }
                          description: 'from'
                          required: [
                            'member'
                          ]
                        }
                        'source-user': {
                          type: 'object'
                          properties: {
                            member: {
                              type: 'string'
                              description: 'Enter the source-user member, Array of strings'
                              title: 'source-user member'
                              default: 'any'
                            }
                          }
                          description: 'source-user'
                        }
                        application: {
                          type: 'object'
                          properties: {
                            member: {
                              type: 'string'
                              description: 'Enter the application member, Array of strings'
                              title: 'application member'
                              default: 'any'
                            }
                          }
                          description: 'application'
                          required: [
                            'member'
                          ]
                        }
                        service: {
                          type: 'object'
                          properties: {
                            member: {
                              type: 'string'
                              description: 'Enter the service member, Array of strings'
                              title: 'service member'
                              default: 'any'
                            }
                          }
                          description: 'service'
                          required: [
                            'member'
                          ]
                        }
                        'hip-profiles': {
                          type: 'object'
                          properties: {
                            member: {
                              type: 'string'
                              description: 'Enter the hip-profiles member, Array of strings'
                              title: 'hip-profiles member'
                              default: 'any'
                            }
                          }
                          description: 'hip-profiles'
                        }
                        action: {
                          type: 'string'
                          description: 'enter the action ex: allow'
                          enum: [
                            'deny'
                            'allow'
                            'drop'
                            'reset-client'
                            'reset-server'
                            'reset-both'
                          ]
                          title: 'action'
                          default: 'allow'
                        }
                        category: {
                          type: 'object'
                          properties: {
                            member: {
                              type: 'string'
                              description: 'Enter the category member, Array of strings'
                              title: 'category member'
                              default: 'any'
                            }
                          }
                          description: 'category'
                        }
                        source: {
                          type: 'object'
                          properties: {
                            member: {
                              type: 'string'
                              description: 'Enter the source member, Array of strings for ex:["url.com","panos.com"]'
                              title: 'source member'
                              default: 'any'
                            }
                          }
                          description: 'source'
                          required: [
                            'member'
                          ]
                        }
                        destination: {
                          type: 'object'
                          properties: {
                            member: {
                              type: 'string'
                              description: 'Enter the source member, Array of strings for ex:["1.1.1.1","2.2.2.2"]'
                              title: 'destination member'
                              default: 'any'
                            }
                          }
                          description: 'destination'
                          required: [
                            'member'
                          ]
                        }
                      }
                      description: 'entry'
                      required: [
                        '@name'
                        'action'
                        'application'
                        'category'
                        'destination'
                        'from'
                        'hip-profiles'
                        'service'
                        'source'
                        'to'
                      ]
                    }
                  }
                  required: [
                    'entry'
                  ]
                }
              }
            ]
            summary: 'Update security policy rule'
            description: 'update address object to existing Security Policy Rule'
            operationId: 'Updatesecuritypolicyrule'
            'x-ms-visibility': 'important'
          }
        }
        '/restapi/v10.0/Objects/CustomURLCategories': {
          get: {
            responses: {
              default: {
                description: 'default'
                schema: {
                  type: 'object'
                  properties: {
                    '@status': {
                      type: 'string'
                      description: 'status if success or failure'
                      title: '@status'
                    }
                    '@code': {
                      type: 'string'
                      description: 'status code'
                      title: '@code'
                    }
                    result: {
                      type: 'object'
                      properties: {
                        '@total-count': {
                          type: 'string'
                          description: 'total count of URL filtering category info present in PAN-OS'
                          title: '@total-count'
                        }
                        '@count': {
                          type: 'string'
                          description: 'count of the list of URL filtering category info'
                          title: '@count'
                        }
                        entry: {
                          type: 'array'
                          items: {
                            type: 'object'
                            properties: {
                              '@name': {
                                type: 'string'
                                description: 'name of URL filtering category information'
                                title: '@name'
                              }
                              '@location': {
                                type: 'string'
                                description: 'location of the URL filtering category info. default value is vsys'
                                title: '@location'
                              }
                              '@vsys': {
                                type: 'string'
                                description: 'vsys location name of URL filtering category info. default value is vsys1'
                                title: '@vsys'
                              }
                              description: {
                                type: 'string'
                                description: 'description of URL filtering category information'
                                title: 'description'
                              }
                              list: {
                                type: 'object'
                                properties: {
                                  member: {
                                    type: 'array'
                                    items: {
                                      type: 'string'
                                    }
                                    description: 'member'
                                  }
                                }
                                description: 'list'
                              }
                              type: {
                                type: 'string'
                                description: 'type of URL filtering category info'
                                title: 'type'
                              }
                            }
                          }
                          description: 'entry'
                        }
                      }
                      description: 'result'
                    }
                  }
                }
              }
            }
            summary: 'List custom url categories'
            description: 'List custom url categories'
            operationId: 'Listcustomurlcategories'
            'x-ms-visibility': 'important'
            parameters: [
              {
                name: 'location'
                in: 'query'
                required: true
                type: 'string'
                default: 'vsys'
                description: 'Enter the location'
              }
              {
                name: 'vsys'
                in: 'query'
                required: true
                type: 'string'
                default: 'vsys1'
                description: 'Enter the vsys location name'
              }
              {
                name: 'name'
                in: 'query'
                required: false
                type: 'string'
                description: 'filter by custom url category name'
                'x-ms-summary': 'name'
              }
            ]
          }
        }
        '/restapi/v10.0/Objects/Addresses': {
          get: {
            responses: {
              default: {
                description: 'default'
                schema: {
                  type: 'object'
                  properties: {
                    '@status': {
                      type: 'string'
                      description: 'status if success or failure'
                      title: '@status'
                    }
                    '@code': {
                      type: 'string'
                      description: 'status code'
                      title: '@code'
                    }
                    result: {
                      type: 'object'
                      properties: {
                        '@total-count': {
                          type: 'string'
                          description: 'total count of address objects present in PAN-OS VM'
                          title: '@total-count'
                        }
                        '@count': {
                          type: 'string'
                          description: 'count of address objects present in PAN-OS'
                          title: '@count'
                        }
                        entry: {
                          type: 'array'
                          items: {
                            type: 'object'
                            properties: {
                              '@name': {
                                type: 'string'
                                description: 'Enter the name of the address object'
                                title: '@name'
                              }
                              '@location': {
                                type: 'string'
                                description: 'location of PAN-OS VM. default value is vsys'
                                title: '@location'
                              }
                              '@vsys': {
                                type: 'string'
                                description: 'vsys location name of address object. default value is vsys1'
                                title: '@vsys'
                              }
                              description: {
                                type: 'string'
                                description: 'description of address object'
                                title: 'description'
                              }
                              fqdn: {
                                type: 'string'
                                description: 'URL address of address object'
                                title: 'fqdn'
                              }
                              'ip-netmask': {
                                type: 'string'
                                description: 'Ip address of address object'
                                title: 'ip-netmask'
                              }
                            }
                          }
                          description: 'entry'
                        }
                      }
                      description: 'result'
                    }
                  }
                }
              }
            }
            summary: 'List address objects'
            description: 'List address objects'
            operationId: 'Listaddressobjects'
            'x-ms-visibility': 'important'
            parameters: [
              {
                name: 'location'
                in: 'query'
                required: true
                type: 'string'
                default: 'vsys'
                description: 'Enter the location'
              }
              {
                name: 'vsys'
                in: 'query'
                required: true
                type: 'string'
                default: 'vsys1'
                description: 'Enter the vsys location name'
              }
              {
                name: 'name'
                in: 'query'
                required: false
                type: 'string'
                description: 'filter by address object name'
                'x-ms-summary': 'name'
              }
            ]
          }
          post: {
            responses: {
              default: {
                description: 'default'
                schema: {
                  type: 'object'
                  properties: {
                    '@status': {
                      type: 'string'
                      description: 'status if success or failure'
                      title: '@status'
                    }
                    '@code': {
                      type: 'string'
                      description: 'status code'
                      title: '@code'
                    }
                    msg: {
                      type: 'string'
                      description: 'success or failure msg'
                      title: 'msg'
                    }
                  }
                }
              }
            }
            summary: 'Create an address object'
            description: 'creates address object'
            'x-ms-visibility': 'important'
            operationId: 'Createanaddressobject'
            parameters: [
              {
                name: 'location'
                in: 'query'
                required: true
                type: 'string'
                default: 'vsys'
                description: 'Enter the location'
              }
              {
                name: 'vsys'
                in: 'query'
                required: true
                type: 'string'
                default: 'vsys1'
                description: 'Enter the vsys location name'
              }
              {
                name: 'name'
                in: 'query'
                required: true
                type: 'string'
                description: 'Enter the name of address object'
              }
              {
                name: 'address type'
                in: 'query'
                required: true
                type: 'string'
                enum: [
                  'ip-netmask'
                  'fqdn'
                ]
              }
              {
                name: 'body'
                in: 'body'
                required: true
                schema: {
                  type: 'object'
                  properties: {
                    entry: {
                      type: 'object'
                      properties: {
                        '@name': {
                          type: 'string'
                          description: 'Enter the name of address object'
                          title: 'name'
                        }
                        fqdn: {
                          type: 'string'
                          description: 'Enter the URL ex:url.com'
                          title: 'fqdn'
                          'x-ms-visibility': 'advanced'
                        }
                        'ip-netmask': {
                          type: 'string'
                          description: 'Enter the IP address ex:1.1.1.1'
                          title: 'ip-netmask'
                          'x-ms-visibility': 'advanced'
                        }
                        description: {
                          type: 'string'
                          description: 'Enter the description'
                          title: 'description'
                        }
                      }
                      description: 'entry'
                      required: [
                        '@name'
                        'description'
                      ]
                    }
                  }
                  required: [
                    'entry'
                  ]
                }
              }
            ]
          }
          put: {
            responses: {
              default: {
                description: 'default'
                schema: {
                  type: 'object'
                  properties: {
                    '@status': {
                      type: 'string'
                      description: 'status if success or failure'
                      title: '@status'
                    }
                    '@code': {
                      type: 'string'
                      description: 'status code'
                      title: '@code'
                    }
                    msg: {
                      type: 'string'
                      description: 'status message'
                      title: 'msg'
                    }
                  }
                }
              }
            }
            summary: 'Update an address object'
            operationId: 'Updateaddressobject'
            'x-ms-visibility': 'important'
            description: 'Updates an address objects parameters.'
            parameters: [
              {
                name: 'location'
                in: 'query'
                required: true
                type: 'string'
                default: 'vsys'
                description: 'Enter the location'
              }
              {
                name: 'vsys'
                in: 'query'
                required: true
                type: 'string'
                default: 'vsys1'
                description: 'Enter the vsys location name'
              }
              {
                name: 'name'
                in: 'query'
                required: true
                type: 'string'
                description: 'Enter the name of address object'
                'x-ms-summary': 'name'
              }
              {
                name: 'address type'
                in: 'query'
                required: true
                type: 'string'
                enum: [
                  'ip-netmask'
                  'fqdn'
                ]
              }
              {
                name: 'body'
                in: 'body'
                required: true
                schema: {
                  type: 'object'
                  properties: {
                    entry: {
                      type: 'object'
                      properties: {
                        '@name': {
                          type: 'string'
                          description: 'Enter the name of address object'
                          title: 'name'
                        }
                        fqdn: {
                          type: 'string'
                          description: 'Enter the URL for ex:url.com'
                          title: 'fqdn'
                          'x-ms-visibility': 'advanced'
                        }
                        'ip-netmask': {
                          type: 'string'
                          description: 'Enter the IP address for ex: 1.1.1.1'
                          title: 'ip-netmask'
                          'x-ms-visibility': 'advanced'
                        }
                        description: {
                          type: 'string'
                          description: 'Enter the description'
                          title: 'description'
                        }
                      }
                      description: 'entry'
                      required: [
                        '@name'
                        'description'
                      ]
                    }
                  }
                  required: [
                    'entry'
                  ]
                }
              }
            ]
          }
        }
        '/restapi/v10.0/Objects/AddressGroups': {
          get: {
            responses: {
              default: {
                description: 'default'
                schema: {
                  type: 'object'
                  properties: {
                    '@status': {
                      type: 'string'
                      description: 'status if success or failure'
                      title: '@status'
                    }
                    '@code': {
                      type: 'string'
                      description: 'status code'
                      title: '@code'
                    }
                    result: {
                      type: 'object'
                      properties: {
                        '@total-count': {
                          type: 'string'
                          description: 'total count of address object groups present in PAN-OS VM'
                          title: '@total-count'
                        }
                        '@count': {
                          type: 'string'
                          description: 'count of address object groups present in PAN-OS VM'
                          title: '@count'
                        }
                        entry: {
                          type: 'array'
                          items: {
                            type: 'object'
                            properties: {
                              '@name': {
                                type: 'string'
                                description: 'Enter the name of address object group'
                                title: '@name'
                              }
                              '@location': {
                                type: 'string'
                                description: 'location of address object group'
                                title: '@location'
                              }
                              '@vsys': {
                                type: 'string'
                                description: 'vys location name of address object group'
                                title: '@vsys'
                              }
                              static: {
                                type: 'object'
                                properties: {
                                  member: {
                                    type: 'array'
                                    items: {
                                      type: 'string'
                                    }
                                    description: 'member'
                                  }
                                }
                                description: 'static'
                              }
                            }
                          }
                          description: 'entry'
                        }
                      }
                      description: 'result'
                    }
                  }
                }
              }
            }
            summary: 'List address groups'
            operationId: 'Listaddressgroups'
            'x-ms-visibility': 'important'
            description: 'List address groups'
            parameters: [
              {
                name: 'location'
                in: 'query'
                required: true
                type: 'string'
                default: 'vsys'
                description: 'Enter the location'
              }
              {
                name: 'vsys'
                in: 'query'
                required: true
                type: 'string'
                default: 'vsys1'
                description: 'Enter the vsys location name'
              }
              {
                name: 'name'
                in: 'query'
                required: false
                type: 'string'
                description: 'filter by address group name'
                'x-ms-summary': 'name'
              }
            ]
          }
          post: {
            responses: {
              default: {
                description: 'default'
                schema: {
                  type: 'object'
                  properties: {
                    '@status': {
                      type: 'string'
                      description: 'status if success or failure'
                      title: '@status'
                    }
                    '@code': {
                      type: 'string'
                      description: 'statuscode'
                      title: '@code'
                    }
                    msg: {
                      type: 'string'
                      description: 'status message'
                      title: 'msg'
                    }
                  }
                }
              }
            }
            summary: 'Create an address object group'
            description: 'Creates an address object group'
            operationId: 'Createaddressobjectgroup'
            'x-ms-visibility': 'important'
            parameters: [
              {
                name: 'location'
                in: 'query'
                required: true
                type: 'string'
                default: 'vsys'
                description: 'Enter the location'
              }
              {
                name: 'vsys'
                in: 'query'
                required: true
                type: 'string'
                default: 'vsys1'
                description: 'Enter the vsys location name'
              }
              {
                name: 'name'
                in: 'query'
                required: true
                type: 'string'
                description: 'Enter the name of security policy rule'
              }
              {
                name: 'body'
                in: 'body'
                required: true
                schema: {
                  type: 'object'
                  properties: {
                    entry: {
                      type: 'object'
                      properties: {
                        '@name': {
                          type: 'string'
                          description: 'Enter the name of address object group'
                          title: 'name'
                        }
                        static: {
                          type: 'object'
                          properties: {
                            member: {
                              type: 'string'
                              description: 'Enter the whole array of members i.e existing and also new ones'
                              title: 'member'
                            }
                          }
                          description: 'static'
                          required: [
                            'member'
                          ]
                        }
                      }
                      description: 'entry'
                      required: [
                        '@name'
                        'static'
                      ]
                    }
                  }
                  required: [
                    'entry'
                  ]
                }
              }
            ]
          }
          put: {
            responses: {
              default: {
                description: 'default'
                schema: {
                  type: 'object'
                  properties: {
                    '@status': {
                      type: 'string'
                      description: 'status if success or failure'
                      title: '@status'
                    }
                    '@code': {
                      type: 'string'
                      description: 'statuscode'
                      title: '@code'
                    }
                    msg: {
                      type: 'string'
                      description: 'status message'
                      title: 'msg'
                    }
                  }
                }
              }
            }
            summary: 'Update an address object group'
            operationId: 'Updateanaddressobjectgroup'
            description: 'Update the address object group'
            'x-ms-visibility': 'important'
            parameters: [
              {
                name: 'location'
                in: 'query'
                required: true
                type: 'string'
                default: 'vsys'
                description: 'Enter the location'
              }
              {
                name: 'vsys'
                in: 'query'
                required: true
                type: 'string'
                default: 'vsys1'
                description: 'Enter the vsys location name'
              }
              {
                name: 'name'
                in: 'query'
                required: true
                type: 'string'
                description: 'Enter the name of the address object group'
              }
              {
                name: 'body'
                in: 'body'
                required: true
                schema: {
                  type: 'object'
                  properties: {
                    entry: {
                      type: 'object'
                      properties: {
                        '@name': {
                          type: 'string'
                          description: 'Enter the name of address object group'
                          title: 'name'
                        }
                        static: {
                          type: 'object'
                          properties: {
                            member: {
                              type: 'string'
                              description: 'Enter the whole array of members i.e existing and also new ones'
                              title: 'member'
                            }
                          }
                          description: 'static'
                          required: [
                            'member'
                          ]
                        }
                      }
                      description: 'entry'
                      required: [
                        '@name'
                        'static'
                      ]
                    }
                  }
                  required: [
                    'entry'
                  ]
                }
              }
            ]
          }
        }
        '/restapi/v10.0/Objects/URLFilteringSecurityProfiles': {
          get: {
            responses: {
              default: {
                description: 'default'
                schema: {
                  type: 'object'
                  properties: {
                    '@status': {
                      type: 'string'
                      description: 'status if success or failure'
                      title: '@status'
                    }
                    '@code': {
                      type: 'string'
                      description: 'status code'
                      title: '@code'
                    }
                    result: {
                      type: 'object'
                      properties: {
                        '@total-count': {
                          type: 'string'
                          description: 'total count of url filtering security profile information'
                          title: '@total-count'
                        }
                        '@count': {
                          type: 'string'
                          description: 'count of url filtering security profile information'
                          title: '@count'
                        }
                        entry: {
                          type: 'array'
                          items: {
                            type: 'object'
                            properties: {
                              '@name': {
                                type: 'string'
                                description: 'Enter the name of URL filtering category security profile'
                                title: '@name'
                              }
                              '@location': {
                                type: 'string'
                                description: 'location of URL filtering security profile'
                                title: '@location'
                              }
                              '@vsys': {
                                type: 'string'
                                description: '@vsys'
                              }
                              description: {
                                type: 'string'
                                description: 'description of url filtering security info'
                                title: 'description'
                              }
                              'credential-enforcement': {
                                type: 'object'
                                properties: {
                                  mode: {
                                    type: 'object'
                                    properties: {
                                      disabled: {
                                        type: 'object'
                                        properties: {}
                                        description: 'disabled'
                                      }
                                    }
                                    description: 'mode'
                                  }
                                  'log-severity': {
                                    type: 'string'
                                    description: 'log-severity of filtering security category info'
                                    title: 'log-severity'
                                  }
                                }
                                description: 'credential-enforcement'
                              }
                              'log-http-hdr-user-agent': {
                                type: 'string'
                                description: 'log-http-hdr-user-agent'
                                title: 'log-http-hdr-user-agent'
                              }
                              'mlav-engine-urlbased-enabled': {
                                type: 'object'
                                properties: {
                                  entry: {
                                    type: 'array'
                                    items: {
                                      type: 'object'
                                      properties: {
                                        '@name': {
                                          type: 'string'
                                          description: 'Enter the name of URL filtering category security profile'
                                        }
                                        'mlav-policy-action': {
                                          type: 'string'
                                          description: 'mlav-policy-action'
                                        }
                                      }
                                    }
                                    description: 'entry'
                                  }
                                }
                                description: 'mlav-engine-urlbased-enabled'
                              }
                            }
                          }
                          description: 'entry'
                        }
                      }
                      description: 'result'
                    }
                  }
                }
              }
            }
            summary: 'List url filtering security profiles'
            description: 'List url filtering security profiles'
            operationId: 'Listurlfilteringsecurityprofiles'
            'x-ms-visibility': 'important'
            parameters: [
              {
                name: 'location'
                in: 'query'
                required: true
                type: 'string'
                default: 'vsys'
                description: 'Enter the location'
              }
              {
                name: 'vsys'
                in: 'query'
                required: true
                type: 'string'
                default: 'vsys1'
                description: 'Enter the vsys location name'
              }
              {
                name: 'name'
                in: 'query'
                required: false
                type: 'string'
                description: 'filter by name of URL filtering security profile'
                'x-ms-summary': 'name'
              }
            ]
          }
          put: {
            responses: {
              default: {
                description: 'default'
                schema: {
                  type: 'object'
                  properties: {
                    '@status': {
                      type: 'string'
                      description: 'status if success or failure'
                      title: '@status'
                    }
                    '@code': {
                      type: 'string'
                      description: 'status code'
                      title: '@code'
                    }
                    msg: {
                      type: 'string'
                      description: 'status msg'
                      title: 'msg'
                    }
                  }
                }
              }
            }
            summary: 'Update an url filtering security profile'
            operationId: 'Updateanurlfilteringsecurityprofile'
            description: 'Update an url filtering security profile'
            'x-ms-visibility': 'important'
            parameters: [
              {
                name: 'location'
                in: 'query'
                required: true
                type: 'string'
                default: 'vsys'
              }
              {
                name: 'vsys'
                in: 'query'
                required: true
                type: 'string'
                default: 'vsys1'
              }
              {
                name: 'name'
                in: 'query'
                required: true
                type: 'string'
                description: 'Enter the name of URL filtering category security profile'
              }
              {
                name: 'body'
                in: 'body'
                required: true
                schema: {
                  type: 'object'
                  properties: {
                    entry: {
                      type: 'object'
                      properties: {
                        '@name': {
                          type: 'string'
                          description: 'Enter the name of URL filtering category security profile'
                          title: 'name'
                        }
                        description: {
                          type: 'string'
                          description: 'Enter the description'
                          title: 'description'
                        }
                        allow: {
                          type: 'object'
                          properties: {
                            member: {
                              type: 'string'
                              description: 'categories to allow, Array of strings'
                              title: 'allow member'
                            }
                          }
                          description: 'allow'
                        }
                        alert: {
                          type: 'object'
                          properties: {
                            member: {
                              type: 'string'
                              description: 'Categories to alert on, Array of strings'
                              title: 'alert member'
                            }
                          }
                          description: 'alert'
                        }
                        block: {
                          type: 'object'
                          properties: {
                            member: {
                              type: 'string'
                              description: 'Categories to block, Array of strings'
                              title: 'block member'
                            }
                          }
                          description: 'block'
                        }
                        continue: {
                          type: 'object'
                          properties: {
                            member: {
                              type: 'string'
                              description: 'Categories to continue, Array of strings'
                              title: 'continue member'
                            }
                          }
                          description: 'continue'
                        }
                        override: {
                          type: 'object'
                          properties: {
                            member: {
                              type: 'string'
                              description: 'Categories to admin override, Array of strings'
                              title: 'override member'
                            }
                          }
                          description: 'override'
                        }
                        'credential-enforcement': {
                          type: 'object'
                          properties: {
                            mode: {
                              type: 'object'
                              properties: {
                                disabled: {
                                  type: 'object'
                                  properties: {}
                                  description: 'disabled (object) or ip-user (object) or domain-credentials (object) or group-mapping (object)'
                                }
                              }
                              description: 'mode'
                            }
                            'log-severity': {
                              type: 'string'
                              description: 'Log severity when credential matched'
                              title: 'credential-enforcement log severity'
                              default: 'any'
                            }
                            allow: {
                              type: 'object'
                              properties: {
                                member: {
                                  type: 'string'
                                  description: 'Categories to allow and bypass credential enforcement'
                                  title: 'credential-enforcement allow member'
                                }
                              }
                              description: 'allow'
                            }
                            alert: {
                              type: 'object'
                              properties: {
                                member: {
                                  type: 'string'
                                  description: 'Categories to alert on credential match'
                                  title: 'credential-enforcement alert member'
                                }
                              }
                              description: 'alert'
                            }
                            block: {
                              type: 'object'
                              properties: {
                                member: {
                                  type: 'string'
                                  description: 'Categories to block on credential matchmember'
                                  title: 'credential-enforcement allow member'
                                }
                              }
                              description: 'block'
                            }
                            continue: {
                              type: 'object'
                              properties: {
                                member: {
                                  type: 'string'
                                  description: 'Categories to block/continue on credential match'
                                  title: 'credential-enforcement continue member'
                                }
                              }
                              description: 'continue'
                            }
                          }
                          description: 'credential-enforcement'
                          required: [
                            'mode'
                            'log-severity'
                          ]
                        }
                        'enable-container-page': {
                          type: 'string'
                          description: 'Enter the enable-container-page'
                          title: 'enable-container-page'
                          enum: [
                            true
                            false
                          ]
                          default: true
                        }
                        'log-container-page-only': {
                          type: 'string'
                          description: 'Log container page only'
                          title: 'log-container-page-only'
                          enum: [
                            true
                            false
                          ]
                          default: true
                        }
                        'safe-search-enforcement': {
                          type: 'string'
                          description: 'Safe-Search will be enforced if it is set'
                          title: 'safe-search-enforcement'
                          enum: [
                            true
                            false
                          ]
                          default: false
                        }
                        'log-http-hdr-xff': {
                          type: 'string'
                          description: 'Log HTTP Header X-Forwarded-For field'
                          title: 'log-http-hdr-xff'
                          enum: [
                            true
                            false
                          ]
                        }
                        'log-http-hdr-user-agent': {
                          type: 'string'
                          description: 'Log HTTP Header User-Agent field'
                          title: 'log-http-hdr-user-agent'
                          enum: [
                            true
                            false
                          ]
                          default: false
                        }
                        'log-http-hdr-referer': {
                          type: 'string'
                          description: 'Log HTTP Header Referer field'
                          title: 'log-http-hdr-referer'
                          enum: [
                            true
                            false
                          ]
                        }
                        'http-header-insertion': {
                          type: 'object'
                          properties: {
                            entry: {
                              type: 'object'
                              properties: {
                                '@name': {
                                  type: 'string'
                                  description: 'Enter the http-header-insertion entry name'
                                  title: 'http-header-insertion entry name'
                                }
                                type: {
                                  type: 'object'
                                  properties: {
                                    entry: {
                                      type: 'object'
                                      properties: {
                                        '@name': {
                                          type: 'string'
                                          description: 'Enter the http-header-insertion type entry name'
                                          title: 'http-header-insertion type entry name'
                                        }
                                        headers: {
                                          type: 'object'
                                          properties: {
                                            entry: {
                                              type: 'object'
                                              properties: {
                                                '@name': {
                                                  type: 'string'
                                                  description: 'Enter the http-header-insertion entry type entry headers entry name'
                                                  title: 'http-header-insertion entry type entry headers entry name'
                                                }
                                                header: {
                                                  type: 'string'
                                                  description: 'Enter the http-header-insertion entry type entry headers entry header'
                                                  title: 'http-header-insertion entry type entry headers entry header'
                                                }
                                                value: {
                                                  type: 'string'
                                                  description: 'Enter the http-header-insertion entry type entry headers entry value'
                                                  title: 'http-header-insertion entry type entry headers entry value'
                                                }
                                                log: {
                                                  type: 'string'
                                                  description: 'Enter the http-header-insertion entry type entry headers entry log'
                                                  title: 'http-header-insertion entry type entry headers entry log'
                                                  default: false
                                                  enum: [
                                                    true
                                                    false
                                                  ]
                                                }
                                              }
                                              description: 'entry'
                                              required: [
                                                'name'
                                                'header'
                                                'value'
                                                'log'
                                              ]
                                            }
                                          }
                                          description: 'headers'
                                          required: [
                                            'entry'
                                          ]
                                        }
                                        domains: {
                                          type: 'object'
                                          properties: {
                                            member: {
                                              type: 'string'
                                              description: 'Enter the http-header-insertion entry type entry domains member'
                                              title: 'http-header-insertion entry type entry domains member'
                                            }
                                          }
                                          description: 'domains'
                                          required: [
                                            'member'
                                          ]
                                        }
                                      }
                                      description: 'entry'
                                    }
                                  }
                                  description: 'type'
                                  required: [
                                    'entry'
                                  ]
                                }
                              }
                              description: 'entry'
                              required: [
                                '@name'
                                'type'
                                'domains'
                              ]
                            }
                          }
                          description: 'http-header-insertion'
                          required: [
                            'entry'
                          ]
                        }
                        'mlav-category-exception': {
                          type: 'object'
                          properties: {
                            member: {
                              type: 'string'
                              description: 'Enter the mlav-category-exception member'
                              title: 'mlav-category-exception member'
                            }
                          }
                          description: 'mlav-category-exception'
                          required: [
                            'member'
                          ]
                        }
                        'mlav-engine-urlbased-enabled': {
                          type: 'object'
                          properties: {
                            entry: {
                              type: 'object'
                              properties: {
                                '@name': {
                                  type: 'string'
                                  description: 'Enter the mlav-engine-urlbased-enabled entry name'
                                  title: 'mlav-engine-urlbased-enabled entry name'
                                }
                                'mlav-policy-action': {
                                  type: 'string'
                                  description: 'Enter the mlav-engine-urlbased-enabled mlav-policy-action'
                                  title: 'mlav-engine-urlbased-enabled mlav-policy-action'
                                  enum: [
                                    'block'
                                    'alert'
                                    'allow'
                                  ]
                                }
                              }
                              description: 'entry'
                              required: [
                                '@name'
                                'mlav-policy-action'
                              ]
                            }
                          }
                          description: 'mlav-engine-urlbased-enabled'
                          required: [
                            'entry'
                          ]
                        }
                      }
                      description: 'entry'
                      required: [
                        '@name'
                        'allow'
                        'alert'
                        'continue'
                        'block'
                        'credential-enforcement'
                        'description'
                        'enable-container-page'
                        'http-header-insertion'
                        'log-container-page-only'
                        'log-http-hdr-user-agent'
                        'mlav-category-exception'
                        'mlav-engine-urlbased-enabled'
                        'override'
                        'safe-search-enforcement'
                        'log-http-hdr-xff'
                        'log-http-hdr-referer'
                      ]
                    }
                  }
                  required: [
                    'entry'
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
        'API Key': {
          type: 'apiKey'
          in: 'header'
          name: 'X-PAN-KEY'
        }
      }
      security: [
        {
          'API Key': []
        }
      ]
      tags: []
    }
  }
}
