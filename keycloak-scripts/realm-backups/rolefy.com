{
  "id": "rolefy",
  "realm": "rolefy",
  "displayName": "Rolefy.com",
  "notBefore": 0,
  "revokeRefreshToken": false,
  "accessTokenLifespan": 300,
  "accessTokenLifespanForImplicitFlow": 900,
  "ssoSessionIdleTimeout": 1800,
  "ssoSessionMaxLifespan": 36000,
  "offlineSessionIdleTimeout": 2592000,
  "accessCodeLifespan": 60,
  "accessCodeLifespanUserAction": 300,
  "accessCodeLifespanLogin": 1800,
  "actionTokenGeneratedByAdminLifespan": 43200,
  "actionTokenGeneratedByUserLifespan": 300,
  "enabled": true,
  "sslRequired": "external",
  "registrationAllowed": false,
  "registrationEmailAsUsername": false,
  "rememberMe": false,
  "verifyEmail": false,
  "loginWithEmailAllowed": true,
  "duplicateEmailsAllowed": false,
  "resetPasswordAllowed": false,
  "editUsernameAllowed": false,
  "bruteForceProtected": false,
  "permanentLockout": false,
  "maxFailureWaitSeconds": 900,
  "minimumQuickLoginWaitSeconds": 60,
  "waitIncrementSeconds": 60,
  "quickLoginCheckMilliSeconds": 1000,
  "maxDeltaTimeSeconds": 43200,
  "failureFactor": 30,
  "roles": {
    "realm": [
      {
        "id": "423c59d9-2aaf-4f1e-a2eb-12f27f1fe6bd",
        "name": "admin",
        "scopeParamRequired": false,
        "composite": false,
        "clientRole": false,
        "containerId": "rolefy"
      },
      {
        "id": "63aaa682-0c56-4e87-b7cf-7e1c7bf5aa10",
        "name": "offline_access",
        "description": "${role_offline-access}",
        "scopeParamRequired": true,
        "composite": false,
        "clientRole": false,
        "containerId": "rolefy"
      },
      {
        "id": "0f4d00da-e0d7-4bd1-b72b-216978bbb374",
        "name": "user",
        "scopeParamRequired": false,
        "composite": false,
        "clientRole": false,
        "containerId": "rolefy"
      },
      {
        "id": "0f661e98-ea90-403f-bb4e-f709833c74b7",
        "name": "uma_authorization",
        "description": "${role_uma_authorization}",
        "scopeParamRequired": false,
        "composite": false,
        "clientRole": false,
        "containerId": "rolefy"
      }
    ],
    "client": {
      "realm-management": [
        {
          "id": "777f0057-2a04-47e6-ba42-1684d2573966",
          "name": "manage-events",
          "description": "${role_manage-events}",
          "scopeParamRequired": false,
          "composite": false,
          "clientRole": true,
          "containerId": "12889c5f-7830-4ac6-9d07-f587c1e5122d"
        },
        {
          "id": "5297d1fc-5dcd-4851-8b60-e873e87466cc",
          "name": "query-clients",
          "description": "${role_query-clients}",
          "scopeParamRequired": false,
          "composite": false,
          "clientRole": true,
          "containerId": "12889c5f-7830-4ac6-9d07-f587c1e5122d"
        },
        {
          "id": "b7e8b069-e8da-4c4c-a945-e929c8b2e609",
          "name": "view-realm",
          "description": "${role_view-realm}",
          "scopeParamRequired": false,
          "composite": false,
          "clientRole": true,
          "containerId": "12889c5f-7830-4ac6-9d07-f587c1e5122d"
        },
        {
          "id": "b62d3ba4-394e-487f-a17f-733553f2c4a3",
          "name": "view-identity-providers",
          "description": "${role_view-identity-providers}",
          "scopeParamRequired": false,
          "composite": false,
          "clientRole": true,
          "containerId": "12889c5f-7830-4ac6-9d07-f587c1e5122d"
        },
        {
          "id": "5c898af2-29fd-4c62-b726-c48d0d1ecd30",
          "name": "manage-authorization",
          "description": "${role_manage-authorization}",
          "scopeParamRequired": false,
          "composite": false,
          "clientRole": true,
          "containerId": "12889c5f-7830-4ac6-9d07-f587c1e5122d"
        },
        {
          "id": "42372549-5ef9-4244-8fc7-ed08f1134779",
          "name": "view-clients",
          "description": "${role_view-clients}",
          "scopeParamRequired": false,
          "composite": true,
          "composites": {
            "client": {
              "realm-management": [
                "query-clients"
              ]
            }
          },
          "clientRole": true,
          "containerId": "12889c5f-7830-4ac6-9d07-f587c1e5122d"
        },
        {
          "id": "dbab8c2b-74e6-4173-bbb6-940f31572f09",
          "name": "manage-clients",
          "description": "${role_manage-clients}",
          "scopeParamRequired": false,
          "composite": false,
          "clientRole": true,
          "containerId": "12889c5f-7830-4ac6-9d07-f587c1e5122d"
        },
        {
          "id": "aa33b7f3-ba4d-4b40-9e32-3219477b1efb",
          "name": "create-client",
          "description": "${role_create-client}",
          "scopeParamRequired": false,
          "composite": false,
          "clientRole": true,
          "containerId": "12889c5f-7830-4ac6-9d07-f587c1e5122d"
        },
        {
          "id": "babe689a-c4de-4b77-a24c-567df199fe0e",
          "name": "manage-realm",
          "description": "${role_manage-realm}",
          "scopeParamRequired": false,
          "composite": false,
          "clientRole": true,
          "containerId": "12889c5f-7830-4ac6-9d07-f587c1e5122d"
        },
        {
          "id": "8a485e91-c47b-4f38-9688-4afb28ed3c66",
          "name": "manage-users",
          "description": "${role_manage-users}",
          "scopeParamRequired": false,
          "composite": false,
          "clientRole": true,
          "containerId": "12889c5f-7830-4ac6-9d07-f587c1e5122d"
        },
        {
          "id": "d5863ed4-a62f-47ed-b309-c7943eddbc5d",
          "name": "query-users",
          "description": "${role_query-users}",
          "scopeParamRequired": false,
          "composite": false,
          "clientRole": true,
          "containerId": "12889c5f-7830-4ac6-9d07-f587c1e5122d"
        },
        {
          "id": "f58f65b3-90e1-4bf6-9058-8fd5bd6d970a",
          "name": "query-groups",
          "description": "${role_query-groups}",
          "scopeParamRequired": false,
          "composite": false,
          "clientRole": true,
          "containerId": "12889c5f-7830-4ac6-9d07-f587c1e5122d"
        },
        {
          "id": "e3d8d1b7-d951-491d-b708-7894e2322a56",
          "name": "realm-admin",
          "description": "${role_realm-admin}",
          "scopeParamRequired": false,
          "composite": true,
          "composites": {
            "client": {
              "realm-management": [
                "manage-events",
                "query-clients",
                "view-realm",
                "view-identity-providers",
                "manage-authorization",
                "view-clients",
                "manage-clients",
                "create-client",
                "manage-realm",
                "manage-users",
                "query-users",
                "query-groups",
                "manage-identity-providers",
                "view-events",
                "query-realms",
                "view-users",
                "view-authorization",
                "impersonation"
              ]
            }
          },
          "clientRole": true,
          "containerId": "12889c5f-7830-4ac6-9d07-f587c1e5122d"
        },
        {
          "id": "dc41b56a-8bb9-49aa-94f5-cfe1ada6745d",
          "name": "manage-identity-providers",
          "description": "${role_manage-identity-providers}",
          "scopeParamRequired": false,
          "composite": false,
          "clientRole": true,
          "containerId": "12889c5f-7830-4ac6-9d07-f587c1e5122d"
        },
        {
          "id": "f234632a-d391-42c7-99f4-4ddc5c61219d",
          "name": "view-events",
          "description": "${role_view-events}",
          "scopeParamRequired": false,
          "composite": false,
          "clientRole": true,
          "containerId": "12889c5f-7830-4ac6-9d07-f587c1e5122d"
        },
        {
          "id": "f8e5901d-af10-4e8f-8819-99aeba8da96c",
          "name": "query-realms",
          "description": "${role_query-realms}",
          "scopeParamRequired": false,
          "composite": false,
          "clientRole": true,
          "containerId": "12889c5f-7830-4ac6-9d07-f587c1e5122d"
        },
        {
          "id": "f58ff170-d05f-42cb-b6f5-6170a7b5b160",
          "name": "view-users",
          "description": "${role_view-users}",
          "scopeParamRequired": false,
          "composite": true,
          "composites": {
            "client": {
              "realm-management": [
                "query-users",
                "query-groups"
              ]
            }
          },
          "clientRole": true,
          "containerId": "12889c5f-7830-4ac6-9d07-f587c1e5122d"
        },
        {
          "id": "fa82b214-16ac-4824-be36-7b1e4b69abe2",
          "name": "view-authorization",
          "description": "${role_view-authorization}",
          "scopeParamRequired": false,
          "composite": false,
          "clientRole": true,
          "containerId": "12889c5f-7830-4ac6-9d07-f587c1e5122d"
        },
        {
          "id": "2774bc4b-bc7e-443b-b99f-0029208bcaab",
          "name": "impersonation",
          "description": "${role_impersonation}",
          "scopeParamRequired": false,
          "composite": false,
          "clientRole": true,
          "containerId": "12889c5f-7830-4ac6-9d07-f587c1e5122d"
        }
      ],
      "security-admin-console": [],
      "admin-cli": [],
      "broker": [
        {
          "id": "b89738ce-db5f-4452-9ee6-592f03d3c039",
          "name": "read-token",
          "description": "${role_read-token}",
          "scopeParamRequired": false,
          "composite": false,
          "clientRole": true,
          "containerId": "7c6227b3-0e46-44dc-bc3a-639e3bfe2eee"
        }
      ],
      "account": [
        {
          "id": "3554c3df-da3e-43ee-a1e0-abb073df181f",
          "name": "manage-account",
          "description": "${role_manage-account}",
          "scopeParamRequired": false,
          "composite": true,
          "composites": {
            "client": {
              "account": [
                "manage-account-links"
              ]
            }
          },
          "clientRole": true,
          "containerId": "518bdad4-9782-4e88-9f0a-54f3f32f27aa"
        },
        {
          "id": "3b5fd00c-9b76-464f-b46d-53a3e6c62868",
          "name": "view-profile",
          "description": "${role_view-profile}",
          "scopeParamRequired": false,
          "composite": false,
          "clientRole": true,
          "containerId": "518bdad4-9782-4e88-9f0a-54f3f32f27aa"
        },
        {
          "id": "3142c08b-4dee-4238-bd3e-506a307ee7c0",
          "name": "manage-account-links",
          "description": "${role_manage-account-links}",
          "scopeParamRequired": false,
          "composite": false,
          "clientRole": true,
          "containerId": "518bdad4-9782-4e88-9f0a-54f3f32f27aa"
        }
      ],
      "rolefy": [
        {
          "id": "f4707eb5-4a78-4ffb-892c-6ededec99641",
          "name": "uma_protection",
          "scopeParamRequired": false,
          "composite": false,
          "clientRole": true,
          "containerId": "ecb4e401-4d0a-4d08-a2da-a8a4cadda642"
        }
      ]
    }
  },
  "groups": [
    {
      "id": "fef58176-9d4e-43ad-a4ab-a2ae73ba1ab3",
      "name": "user",
      "path": "/user",
      "attributes": {},
      "realmRoles": [
        "user"
      ],
      "clientRoles": {},
      "subGroups": []
    },
    {
      "id": "893ec4f0-cfc3-45fe-8499-d9bc64c4dbd7",
      "name": "admin",
      "path": "/admin",
      "attributes": {},
      "realmRoles": [
        "admin",
        "user"
      ],
      "clientRoles": {},
      "subGroups": []
    }
  ],
  "defaultRoles": [
    "offline_access",
    "uma_authorization",
    "user"
  ],
  "defaultGroups": [
    "/user"
  ],
  "requiredCredentials": [
    "password"
  ],
  "otpPolicyType": "totp",
  "otpPolicyAlgorithm": "HmacSHA1",
  "otpPolicyInitialCounter": 0,
  "otpPolicyDigits": 6,
  "otpPolicyLookAheadWindow": 1,
  "otpPolicyPeriod": 30,
  "clients": [
    {
      "id": "518bdad4-9782-4e88-9f0a-54f3f32f27aa",
      "clientId": "account",
      "name": "${client_account}",
      "baseUrl": "/auth/realms/rolefy/account",
      "surrogateAuthRequired": false,
      "enabled": true,
      "clientAuthenticatorType": "client-secret",
      "secret": "**********",
      "defaultRoles": [
        "view-profile",
        "manage-account"
      ],
      "redirectUris": [
        "/auth/realms/rolefy/account/*"
      ],
      "webOrigins": [],
      "notBefore": 0,
      "bearerOnly": false,
      "consentRequired": false,
      "standardFlowEnabled": true,
      "implicitFlowEnabled": false,
      "directAccessGrantsEnabled": false,
      "serviceAccountsEnabled": false,
      "publicClient": false,
      "frontchannelLogout": false,
      "protocol": "openid-connect",
      "attributes": {},
      "fullScopeAllowed": false,
      "nodeReRegistrationTimeout": 0,
      "protocolMappers": [
        {
          "id": "fb4af0b6-b2f9-4313-b787-0e8c73de2b3e",
          "name": "username",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-property-mapper",
          "consentRequired": true,
          "consentText": "${username}",
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "username",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "preferred_username",
            "jsonType.label": "String"
          }
        },
        {
          "id": "8e19ad22-9fa7-448b-b050-5baa083614a9",
          "name": "email",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-property-mapper",
          "consentRequired": true,
          "consentText": "${email}",
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "email",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "email",
            "jsonType.label": "String"
          }
        },
        {
          "id": "4aa43c3e-bf01-4ef6-87bb-6cfa1112ee31",
          "name": "full name",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-full-name-mapper",
          "consentRequired": true,
          "consentText": "${fullName}",
          "config": {
            "id.token.claim": "true",
            "access.token.claim": "true"
          }
        },
        {
          "id": "124f0923-2f9a-44c5-90fe-ca88bd6197be",
          "name": "family name",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-property-mapper",
          "consentRequired": true,
          "consentText": "${familyName}",
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "lastName",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "family_name",
            "jsonType.label": "String"
          }
        },
        {
          "id": "51841286-6b31-4dbd-8d33-35e96361585e",
          "name": "given name",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-property-mapper",
          "consentRequired": true,
          "consentText": "${givenName}",
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "firstName",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "given_name",
            "jsonType.label": "String"
          }
        },
        {
          "id": "cd8f9eaa-3c86-4502-81bb-1a73eceb31c9",
          "name": "role list",
          "protocol": "saml",
          "protocolMapper": "saml-role-list-mapper",
          "consentRequired": false,
          "config": {
            "single": "false",
            "attribute.nameformat": "Basic",
            "attribute.name": "Role"
          }
        }
      ],
      "useTemplateConfig": false,
      "useTemplateScope": false,
      "useTemplateMappers": false
    },
    {
      "id": "ecb4e401-4d0a-4d08-a2da-a8a4cadda642",
      "clientId": "rolefy",
      "name": "Rolefy.com",
      "surrogateAuthRequired": false,
      "enabled": true,
      "clientAuthenticatorType": "client-secret",
      "secret": "**********",
      "redirectUris": [
        "http://webapp.rolefy.com",
        "https://webapp.rolefy.com"
      ],
      "webOrigins": [
        "http://webapp.rolefy.com",
        "https://webapp.rolefy.com"
      ],
      "notBefore": 0,
      "bearerOnly": false,
      "consentRequired": false,
      "standardFlowEnabled": true,
      "implicitFlowEnabled": false,
      "directAccessGrantsEnabled": true,
      "serviceAccountsEnabled": true,
      "authorizationServicesEnabled": true,
      "publicClient": false,
      "frontchannelLogout": false,
      "protocol": "openid-connect",
      "attributes": {
        "saml.assertion.signature": "false",
        "saml.force.post.binding": "false",
        "saml.multivalued.roles": "false",
        "saml.encrypt": "false",
        "saml_force_name_id_format": "false",
        "saml.client.signature": "false",
        "saml.authnstatement": "false",
        "saml.server.signature": "false",
        "saml.server.signature.keyinfo.ext": "false",
        "saml.onetimeuse.condition": "false"
      },
      "fullScopeAllowed": true,
      "nodeReRegistrationTimeout": -1,
      "protocolMappers": [
        {
          "id": "9ab077ad-fcdf-48b1-b697-f2cd63739975",
          "name": "full name",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-full-name-mapper",
          "consentRequired": true,
          "consentText": "${fullName}",
          "config": {
            "id.token.claim": "true",
            "access.token.claim": "true"
          }
        },
        {
          "id": "db5b81b7-62e4-4e39-ac61-4310b876741f",
          "name": "username",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-property-mapper",
          "consentRequired": true,
          "consentText": "${username}",
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "username",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "preferred_username",
            "jsonType.label": "String"
          }
        },
        {
          "id": "1c6b4a30-f6e4-40db-a7c1-c875e89e675e",
          "name": "family name",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-property-mapper",
          "consentRequired": true,
          "consentText": "${familyName}",
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "lastName",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "family_name",
            "jsonType.label": "String"
          }
        },
        {
          "id": "bdd97036-26ea-4c12-80f9-f9539f6c0700",
          "name": "Client ID",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usersessionmodel-note-mapper",
          "consentRequired": false,
          "consentText": "",
          "config": {
            "user.session.note": "clientId",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "clientId",
            "jsonType.label": "String"
          }
        },
        {
          "id": "7df449ae-1bdd-478e-bdf9-94b8155bfff7",
          "name": "Client IP Address",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usersessionmodel-note-mapper",
          "consentRequired": false,
          "consentText": "",
          "config": {
            "user.session.note": "clientAddress",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "clientAddress",
            "jsonType.label": "String"
          }
        },
        {
          "id": "d43391d5-7946-476c-a7b6-94cddb9c381c",
          "name": "role list",
          "protocol": "saml",
          "protocolMapper": "saml-role-list-mapper",
          "consentRequired": false,
          "config": {
            "single": "false",
            "attribute.nameformat": "Basic",
            "attribute.name": "Role"
          }
        },
        {
          "id": "36214cb2-e688-41bd-82e0-aacbdee0755f",
          "name": "email",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-property-mapper",
          "consentRequired": true,
          "consentText": "${email}",
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "email",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "email",
            "jsonType.label": "String"
          }
        },
        {
          "id": "e503d469-76b8-4821-8c05-8c9c110db748",
          "name": "given name",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-property-mapper",
          "consentRequired": true,
          "consentText": "${givenName}",
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "firstName",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "given_name",
            "jsonType.label": "String"
          }
        },
        {
          "id": "efbb9173-f11b-4858-b9f6-cd44d38de08b",
          "name": "Client Host",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usersessionmodel-note-mapper",
          "consentRequired": false,
          "consentText": "",
          "config": {
            "user.session.note": "clientHost",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "clientHost",
            "jsonType.label": "String"
          }
        }
      ],
      "useTemplateConfig": false,
      "useTemplateScope": false,
      "useTemplateMappers": false,
      "authorizationSettings": {
        "allowRemoteResourceManagement": false,
        "policyEnforcementMode": "ENFORCING",
        "resources": [
          {
            "name": "Default Resource",
            "uri": "/*",
            "type": "urn:rolefy:resources:default"
          }
        ],
        "policies": [
          {
            "name": "Default Policy",
            "description": "A policy that grants access only for users within this realm",
            "type": "js",
            "logic": "POSITIVE",
            "decisionStrategy": "AFFIRMATIVE",
            "config": {
              "code": "// by default, grants any permission associated with this policy\n$evaluation.grant();\n"
            }
          },
          {
            "name": "Default Permission",
            "description": "A permission that applies to the default resource type",
            "type": "resource",
            "logic": "POSITIVE",
            "decisionStrategy": "UNANIMOUS",
            "config": {
              "defaultResourceType": "urn:rolefy:resources:default",
              "applyPolicies": "[\"Default Policy\"]"
            }
          }
        ],
        "scopes": []
      }
    },
    {
      "id": "31c63926-9686-43cf-a031-acbe9a5092b5",
      "clientId": "admin-cli",
      "name": "${client_admin-cli}",
      "surrogateAuthRequired": false,
      "enabled": true,
      "clientAuthenticatorType": "client-secret",
      "secret": "**********",
      "redirectUris": [],
      "webOrigins": [],
      "notBefore": 0,
      "bearerOnly": false,
      "consentRequired": false,
      "standardFlowEnabled": false,
      "implicitFlowEnabled": false,
      "directAccessGrantsEnabled": true,
      "serviceAccountsEnabled": false,
      "publicClient": true,
      "frontchannelLogout": false,
      "protocol": "openid-connect",
      "attributes": {},
      "fullScopeAllowed": false,
      "nodeReRegistrationTimeout": 0,
      "protocolMappers": [
        {
          "id": "3a616102-af3f-4a63-8df4-c035a0cb589e",
          "name": "family name",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-property-mapper",
          "consentRequired": true,
          "consentText": "${familyName}",
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "lastName",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "family_name",
            "jsonType.label": "String"
          }
        },
        {
          "id": "fecca52a-f398-457d-9641-03f44aacc8b3",
          "name": "given name",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-property-mapper",
          "consentRequired": true,
          "consentText": "${givenName}",
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "firstName",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "given_name",
            "jsonType.label": "String"
          }
        },
        {
          "id": "69d1677f-d1e0-4d7d-b367-ea7f5b78f726",
          "name": "full name",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-full-name-mapper",
          "consentRequired": true,
          "consentText": "${fullName}",
          "config": {
            "id.token.claim": "true",
            "access.token.claim": "true"
          }
        },
        {
          "id": "6c98767c-5b6d-49a8-b006-503574d200f0",
          "name": "email",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-property-mapper",
          "consentRequired": true,
          "consentText": "${email}",
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "email",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "email",
            "jsonType.label": "String"
          }
        },
        {
          "id": "7db9b991-d7ec-4cef-88e9-6a3e9bba3c82",
          "name": "username",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-property-mapper",
          "consentRequired": true,
          "consentText": "${username}",
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "username",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "preferred_username",
            "jsonType.label": "String"
          }
        },
        {
          "id": "94a08bf0-d980-4160-8f6b-0007a2a7d5c5",
          "name": "role list",
          "protocol": "saml",
          "protocolMapper": "saml-role-list-mapper",
          "consentRequired": false,
          "config": {
            "single": "false",
            "attribute.nameformat": "Basic",
            "attribute.name": "Role"
          }
        }
      ],
      "useTemplateConfig": false,
      "useTemplateScope": false,
      "useTemplateMappers": false
    },
    {
      "id": "7c6227b3-0e46-44dc-bc3a-639e3bfe2eee",
      "clientId": "broker",
      "name": "${client_broker}",
      "surrogateAuthRequired": false,
      "enabled": true,
      "clientAuthenticatorType": "client-secret",
      "secret": "**********",
      "redirectUris": [],
      "webOrigins": [],
      "notBefore": 0,
      "bearerOnly": false,
      "consentRequired": false,
      "standardFlowEnabled": true,
      "implicitFlowEnabled": false,
      "directAccessGrantsEnabled": false,
      "serviceAccountsEnabled": false,
      "publicClient": false,
      "frontchannelLogout": false,
      "protocol": "openid-connect",
      "attributes": {},
      "fullScopeAllowed": false,
      "nodeReRegistrationTimeout": 0,
      "protocolMappers": [
        {
          "id": "063fce73-d337-4acd-936e-b6f981bd7162",
          "name": "email",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-property-mapper",
          "consentRequired": true,
          "consentText": "${email}",
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "email",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "email",
            "jsonType.label": "String"
          }
        },
        {
          "id": "9668d59f-c7b8-44b1-8a65-402ab4ceb098",
          "name": "family name",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-property-mapper",
          "consentRequired": true,
          "consentText": "${familyName}",
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "lastName",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "family_name",
            "jsonType.label": "String"
          }
        },
        {
          "id": "9e78287b-72a0-4d82-8542-8fe1ffd64643",
          "name": "full name",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-full-name-mapper",
          "consentRequired": true,
          "consentText": "${fullName}",
          "config": {
            "id.token.claim": "true",
            "access.token.claim": "true"
          }
        },
        {
          "id": "98fef85d-aa44-452f-9050-2ab635a3eb26",
          "name": "username",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-property-mapper",
          "consentRequired": true,
          "consentText": "${username}",
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "username",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "preferred_username",
            "jsonType.label": "String"
          }
        },
        {
          "id": "eb4bf53c-cc62-445f-b2bd-8ab37d0bf194",
          "name": "given name",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-property-mapper",
          "consentRequired": true,
          "consentText": "${givenName}",
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "firstName",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "given_name",
            "jsonType.label": "String"
          }
        },
        {
          "id": "6c965d49-9ffc-473d-8d2a-f77c7d441d6e",
          "name": "role list",
          "protocol": "saml",
          "protocolMapper": "saml-role-list-mapper",
          "consentRequired": false,
          "config": {
            "single": "false",
            "attribute.nameformat": "Basic",
            "attribute.name": "Role"
          }
        }
      ],
      "useTemplateConfig": false,
      "useTemplateScope": false,
      "useTemplateMappers": false
    },
    {
      "id": "12889c5f-7830-4ac6-9d07-f587c1e5122d",
      "clientId": "realm-management",
      "name": "${client_realm-management}",
      "surrogateAuthRequired": false,
      "enabled": true,
      "clientAuthenticatorType": "client-secret",
      "secret": "**********",
      "redirectUris": [],
      "webOrigins": [],
      "notBefore": 0,
      "bearerOnly": true,
      "consentRequired": false,
      "standardFlowEnabled": true,
      "implicitFlowEnabled": false,
      "directAccessGrantsEnabled": false,
      "serviceAccountsEnabled": false,
      "publicClient": false,
      "frontchannelLogout": false,
      "protocol": "openid-connect",
      "attributes": {},
      "fullScopeAllowed": false,
      "nodeReRegistrationTimeout": 0,
      "protocolMappers": [
        {
          "id": "656cba18-5866-4fb1-82ca-f47a916bc10f",
          "name": "email",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-property-mapper",
          "consentRequired": true,
          "consentText": "${email}",
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "email",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "email",
            "jsonType.label": "String"
          }
        },
        {
          "id": "13c6ba9a-43af-494b-9be9-f8d75f1482e9",
          "name": "role list",
          "protocol": "saml",
          "protocolMapper": "saml-role-list-mapper",
          "consentRequired": false,
          "config": {
            "single": "false",
            "attribute.nameformat": "Basic",
            "attribute.name": "Role"
          }
        },
        {
          "id": "98cc8835-305f-4d6f-91a5-3945418cf323",
          "name": "username",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-property-mapper",
          "consentRequired": true,
          "consentText": "${username}",
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "username",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "preferred_username",
            "jsonType.label": "String"
          }
        },
        {
          "id": "3af1e4ff-301f-4bdf-b1e1-6bb1d37d65c9",
          "name": "full name",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-full-name-mapper",
          "consentRequired": true,
          "consentText": "${fullName}",
          "config": {
            "id.token.claim": "true",
            "access.token.claim": "true"
          }
        },
        {
          "id": "9d87c6ca-0762-4d7c-ba6c-43299245b142",
          "name": "family name",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-property-mapper",
          "consentRequired": true,
          "consentText": "${familyName}",
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "lastName",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "family_name",
            "jsonType.label": "String"
          }
        },
        {
          "id": "93ae9fe2-9366-4797-b58d-946d784e684d",
          "name": "given name",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-property-mapper",
          "consentRequired": true,
          "consentText": "${givenName}",
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "firstName",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "given_name",
            "jsonType.label": "String"
          }
        }
      ],
      "useTemplateConfig": false,
      "useTemplateScope": false,
      "useTemplateMappers": false
    },
    {
      "id": "b9e57cc1-aa19-446c-8911-2a4e9688ae50",
      "clientId": "security-admin-console",
      "name": "${client_security-admin-console}",
      "baseUrl": "/auth/admin/rolefy/console/index.html",
      "surrogateAuthRequired": false,
      "enabled": true,
      "clientAuthenticatorType": "client-secret",
      "secret": "**********",
      "redirectUris": [
        "/auth/admin/rolefy/console/*"
      ],
      "webOrigins": [],
      "notBefore": 0,
      "bearerOnly": false,
      "consentRequired": false,
      "standardFlowEnabled": true,
      "implicitFlowEnabled": false,
      "directAccessGrantsEnabled": false,
      "serviceAccountsEnabled": false,
      "publicClient": true,
      "frontchannelLogout": false,
      "protocol": "openid-connect",
      "attributes": {},
      "fullScopeAllowed": false,
      "nodeReRegistrationTimeout": 0,
      "protocolMappers": [
        {
          "id": "f2b050c5-7f7c-44f5-8357-d388cfa325f7",
          "name": "email",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-property-mapper",
          "consentRequired": true,
          "consentText": "${email}",
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "email",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "email",
            "jsonType.label": "String"
          }
        },
        {
          "id": "1ee9ff1b-4529-4c2e-b9e0-c2cd1ff60655",
          "name": "full name",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-full-name-mapper",
          "consentRequired": true,
          "consentText": "${fullName}",
          "config": {
            "id.token.claim": "true",
            "access.token.claim": "true"
          }
        },
        {
          "id": "a6ac8709-3bf6-4d37-bb54-2834a2ca3c63",
          "name": "given name",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-property-mapper",
          "consentRequired": true,
          "consentText": "${givenName}",
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "firstName",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "given_name",
            "jsonType.label": "String"
          }
        },
        {
          "id": "3ec387d9-3a43-4714-8c3f-8b755a6b1d43",
          "name": "role list",
          "protocol": "saml",
          "protocolMapper": "saml-role-list-mapper",
          "consentRequired": false,
          "config": {
            "single": "false",
            "attribute.nameformat": "Basic",
            "attribute.name": "Role"
          }
        },
        {
          "id": "38910d24-4bad-4545-9ce0-270bb0b4cdbf",
          "name": "family name",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-property-mapper",
          "consentRequired": true,
          "consentText": "${familyName}",
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "lastName",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "family_name",
            "jsonType.label": "String"
          }
        },
        {
          "id": "19dd38e5-5632-4658-99db-9df5a285d6d7",
          "name": "username",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-property-mapper",
          "consentRequired": true,
          "consentText": "${username}",
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "username",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "preferred_username",
            "jsonType.label": "String"
          }
        },
        {
          "id": "824a4548-cf4d-4f6e-93b4-24a073588ab2",
          "name": "locale",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-attribute-mapper",
          "consentRequired": false,
          "consentText": "${locale}",
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "locale",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "locale",
            "jsonType.label": "String"
          }
        }
      ],
      "useTemplateConfig": false,
      "useTemplateScope": false,
      "useTemplateMappers": false
    }
  ],
  "clientTemplates": [],
  "browserSecurityHeaders": {
    "xContentTypeOptions": "nosniff",
    "xRobotsTag": "none",
    "xFrameOptions": "SAMEORIGIN",
    "xXSSProtection": "1; mode=block",
    "contentSecurityPolicy": "frame-src 'self'"
  },
  "smtpServer": {},
  "loginTheme": "genny",
  "accountTheme": "genny",
  "adminTheme": "genny",
  "emailTheme": "genny",
  "eventsEnabled": false,
  "eventsListeners": [
    "jboss-logging"
  ],
  "enabledEventTypes": [],
  "adminEventsEnabled": false,
  "adminEventsDetailsEnabled": false,
  "components": {
    "org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy": [
      {
        "id": "549eb146-bba2-4594-9a27-954b3f61a360",
        "name": "Full Scope Disabled",
        "providerId": "scope",
        "subType": "anonymous",
        "subComponents": {},
        "config": {}
      },
      {
        "id": "5a9c885c-5bf4-4d7b-ab75-5dfb77fad0f8",
        "name": "Max Clients Limit",
        "providerId": "max-clients",
        "subType": "anonymous",
        "subComponents": {},
        "config": {
          "max-clients": [
            "200"
          ]
        }
      },
      {
        "id": "7e9e3b35-da70-4175-a0b0-6b72e806386d",
        "name": "Allowed Client Templates",
        "providerId": "allowed-client-templates",
        "subType": "authenticated",
        "subComponents": {},
        "config": {}
      },
      {
        "id": "b946d69c-c0c1-4327-bff4-8053e7b00e1b",
        "name": "Allowed Client Templates",
        "providerId": "allowed-client-templates",
        "subType": "anonymous",
        "subComponents": {},
        "config": {}
      },
      {
        "id": "f4ffef70-34e4-4d1b-90fe-1f2a5d219ca0",
        "name": "Allowed Protocol Mapper Types",
        "providerId": "allowed-protocol-mappers",
        "subType": "anonymous",
        "subComponents": {},
        "config": {
          "allowed-protocol-mapper-types": [
            "oidc-address-mapper",
            "saml-role-list-mapper",
            "saml-user-property-mapper",
            "oidc-full-name-mapper",
            "saml-user-attribute-mapper",
            "oidc-usermodel-property-mapper",
            "oidc-usermodel-attribute-mapper",
            "oidc-sha256-pairwise-sub-mapper"
          ],
          "consent-required-for-all-mappers": [
            "true"
          ]
        }
      },
      {
        "id": "ac6d20a1-cfc1-4f86-941c-279519d6f129",
        "name": "Allowed Protocol Mapper Types",
        "providerId": "allowed-protocol-mappers",
        "subType": "authenticated",
        "subComponents": {},
        "config": {
          "allowed-protocol-mapper-types": [
            "saml-role-list-mapper",
            "oidc-sha256-pairwise-sub-mapper",
            "oidc-usermodel-property-mapper",
            "oidc-full-name-mapper",
            "oidc-usermodel-attribute-mapper",
            "saml-user-attribute-mapper",
            "saml-user-property-mapper",
            "oidc-address-mapper"
          ],
          "consent-required-for-all-mappers": [
            "true"
          ]
        }
      },
      {
        "id": "bbcd13d4-7857-49db-968f-8f9df48dd2eb",
        "name": "Consent Required",
        "providerId": "consent-required",
        "subType": "anonymous",
        "subComponents": {},
        "config": {}
      },
      {
        "id": "303dea65-661f-4138-b214-c8c66235fd5c",
        "name": "Trusted Hosts",
        "providerId": "trusted-hosts",
        "subType": "anonymous",
        "subComponents": {},
        "config": {
          "host-sending-registration-request-must-match": [
            "true"
          ],
          "client-uris-must-match": [
            "true"
          ]
        }
      }
    ],
    "org.keycloak.keys.KeyProvider": [
      {
        "id": "1b2843b2-eda1-4333-be01-11f23c6a9c93",
        "name": "rsa-generated",
        "providerId": "rsa-generated",
        "subComponents": {},
        "config": {
          "priority": [
            "100"
          ]
        }
      },
      {
        "id": "9f9bc23f-7575-4b82-9aef-729e6860d9d9",
        "name": "hmac-generated",
        "providerId": "hmac-generated",
        "subComponents": {},
        "config": {
          "priority": [
            "100"
          ]
        }
      }
    ]
  },
  "internationalizationEnabled": true,
  "supportedLocales": [
    "de",
    "no",
    "ru",
    "sv",
    "pt-BR",
    "ja",
    "lt",
    "en",
    "it",
    "fr",
    "es",
    "ca"
  ],
  "defaultLocale": "en",
  "authenticationFlows": [
    {
      "id": "376674ab-ccb1-42ee-b730-149694fd0649",
      "alias": "Handle Existing Account",
      "description": "Handle what to do if there is existing account with same email/username like authenticated identity provider",
      "providerId": "basic-flow",
      "topLevel": false,
      "builtIn": true,
      "authenticationExecutions": [
        {
          "authenticator": "idp-confirm-link",
          "requirement": "REQUIRED",
          "priority": 10,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "authenticator": "idp-email-verification",
          "requirement": "ALTERNATIVE",
          "priority": 20,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "requirement": "ALTERNATIVE",
          "priority": 30,
          "flowAlias": "Verify Existing Account by Re-authentication",
          "userSetupAllowed": false,
          "autheticatorFlow": true
        }
      ]
    },
    {
      "id": "50e83e94-2887-46f3-8061-51cf5083a20b",
      "alias": "Verify Existing Account by Re-authentication",
      "description": "Reauthentication of existing account",
      "providerId": "basic-flow",
      "topLevel": false,
      "builtIn": true,
      "authenticationExecutions": [
        {
          "authenticator": "idp-username-password-form",
          "requirement": "REQUIRED",
          "priority": 10,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "authenticator": "auth-otp-form",
          "requirement": "OPTIONAL",
          "priority": 20,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        }
      ]
    },
    {
      "id": "9c7f0edb-5a1c-43d1-8871-e8ab41e3c837",
      "alias": "browser",
      "description": "browser based authentication",
      "providerId": "basic-flow",
      "topLevel": true,
      "builtIn": true,
      "authenticationExecutions": [
        {
          "authenticator": "auth-cookie",
          "requirement": "ALTERNATIVE",
          "priority": 10,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "authenticator": "auth-spnego",
          "requirement": "DISABLED",
          "priority": 20,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "authenticator": "identity-provider-redirector",
          "requirement": "ALTERNATIVE",
          "priority": 25,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "requirement": "ALTERNATIVE",
          "priority": 30,
          "flowAlias": "forms",
          "userSetupAllowed": false,
          "autheticatorFlow": true
        }
      ]
    },
    {
      "id": "ef16249d-72e3-4bfe-b96b-352b9f212527",
      "alias": "clients",
      "description": "Base authentication for clients",
      "providerId": "client-flow",
      "topLevel": true,
      "builtIn": true,
      "authenticationExecutions": [
        {
          "authenticator": "client-secret",
          "requirement": "ALTERNATIVE",
          "priority": 10,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "authenticator": "client-jwt",
          "requirement": "ALTERNATIVE",
          "priority": 20,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        }
      ]
    },
    {
      "id": "e0a7a381-d07e-4380-89e6-ddebd3fdbb51",
      "alias": "direct grant",
      "description": "OpenID Connect Resource Owner Grant",
      "providerId": "basic-flow",
      "topLevel": true,
      "builtIn": true,
      "authenticationExecutions": [
        {
          "authenticator": "direct-grant-validate-username",
          "requirement": "REQUIRED",
          "priority": 10,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "authenticator": "direct-grant-validate-password",
          "requirement": "REQUIRED",
          "priority": 20,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "authenticator": "direct-grant-validate-otp",
          "requirement": "OPTIONAL",
          "priority": 30,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        }
      ]
    },
    {
      "id": "9fdd8b0a-fe20-4d59-9315-b764e1306736",
      "alias": "docker auth",
      "description": "Used by Docker clients to authenticate against the IDP",
      "providerId": "basic-flow",
      "topLevel": true,
      "builtIn": true,
      "authenticationExecutions": [
        {
          "authenticator": "docker-http-basic-authenticator",
          "requirement": "REQUIRED",
          "priority": 10,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        }
      ]
    },
    {
      "id": "8cd5963a-891a-4963-9593-4f4ed70bb3da",
      "alias": "first broker login",
      "description": "Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account",
      "providerId": "basic-flow",
      "topLevel": true,
      "builtIn": true,
      "authenticationExecutions": [
        {
          "authenticatorConfig": "review profile config",
          "authenticator": "idp-review-profile",
          "requirement": "REQUIRED",
          "priority": 10,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "authenticatorConfig": "create unique user config",
          "authenticator": "idp-create-user-if-unique",
          "requirement": "ALTERNATIVE",
          "priority": 20,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "requirement": "ALTERNATIVE",
          "priority": 30,
          "flowAlias": "Handle Existing Account",
          "userSetupAllowed": false,
          "autheticatorFlow": true
        }
      ]
    },
    {
      "id": "71021c96-f6ce-40d3-b32e-eeffad9cab8b",
      "alias": "forms",
      "description": "Username, password, otp and other auth forms.",
      "providerId": "basic-flow",
      "topLevel": false,
      "builtIn": true,
      "authenticationExecutions": [
        {
          "authenticator": "auth-username-password-form",
          "requirement": "REQUIRED",
          "priority": 10,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "authenticator": "auth-otp-form",
          "requirement": "OPTIONAL",
          "priority": 20,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        }
      ]
    },
    {
      "id": "7ddcf031-17ed-48f7-9ab4-fbd6409e553b",
      "alias": "registration",
      "description": "registration flow",
      "providerId": "basic-flow",
      "topLevel": true,
      "builtIn": true,
      "authenticationExecutions": [
        {
          "authenticator": "registration-page-form",
          "requirement": "REQUIRED",
          "priority": 10,
          "flowAlias": "registration form",
          "userSetupAllowed": false,
          "autheticatorFlow": true
        }
      ]
    },
    {
      "id": "c76c516c-4782-4b8e-85c3-076960a2bfae",
      "alias": "registration form",
      "description": "registration form",
      "providerId": "form-flow",
      "topLevel": false,
      "builtIn": true,
      "authenticationExecutions": [
        {
          "authenticator": "registration-user-creation",
          "requirement": "REQUIRED",
          "priority": 20,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "authenticator": "registration-profile-action",
          "requirement": "REQUIRED",
          "priority": 40,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "authenticator": "registration-password-action",
          "requirement": "REQUIRED",
          "priority": 50,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "authenticator": "registration-recaptcha-action",
          "requirement": "DISABLED",
          "priority": 60,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        }
      ]
    },
    {
      "id": "a2b3468c-0bbf-47d9-ad51-1f91ab751466",
      "alias": "reset credentials",
      "description": "Reset credentials for a user if they forgot their password or something",
      "providerId": "basic-flow",
      "topLevel": true,
      "builtIn": true,
      "authenticationExecutions": [
        {
          "authenticator": "reset-credentials-choose-user",
          "requirement": "REQUIRED",
          "priority": 10,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "authenticator": "reset-credential-email",
          "requirement": "REQUIRED",
          "priority": 20,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "authenticator": "reset-password",
          "requirement": "REQUIRED",
          "priority": 30,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "authenticator": "reset-otp",
          "requirement": "OPTIONAL",
          "priority": 40,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        }
      ]
    },
    {
      "id": "8686b000-b450-4342-85b2-20d824a85de7",
      "alias": "saml ecp",
      "description": "SAML ECP Profile Authentication Flow",
      "providerId": "basic-flow",
      "topLevel": true,
      "builtIn": true,
      "authenticationExecutions": [
        {
          "authenticator": "http-basic-authenticator",
          "requirement": "REQUIRED",
          "priority": 10,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        }
      ]
    }
  ],
  "authenticatorConfig": [
    {
      "id": "8bcd1c42-c9de-4fc0-b878-b94d6d19548c",
      "alias": "create unique user config",
      "config": {
        "require.password.update.after.registration": "false"
      }
    },
    {
      "id": "524d5a9a-9b1d-4c0c-b395-698eaea137d4",
      "alias": "review profile config",
      "config": {
        "update.profile.on.first.login": "missing"
      }
    }
  ],
  "requiredActions": [
    {
      "alias": "CONFIGURE_TOTP",
      "name": "Configure OTP",
      "providerId": "CONFIGURE_TOTP",
      "enabled": true,
      "defaultAction": false,
      "config": {}
    },
    {
      "alias": "UPDATE_PASSWORD",
      "name": "Update Password",
      "providerId": "UPDATE_PASSWORD",
      "enabled": true,
      "defaultAction": false,
      "config": {}
    },
    {
      "alias": "UPDATE_PROFILE",
      "name": "Update Profile",
      "providerId": "UPDATE_PROFILE",
      "enabled": true,
      "defaultAction": false,
      "config": {}
    },
    {
      "alias": "VERIFY_EMAIL",
      "name": "Verify Email",
      "providerId": "VERIFY_EMAIL",
      "enabled": true,
      "defaultAction": false,
      "config": {}
    },
    {
      "alias": "terms_and_conditions",
      "name": "Terms and Conditions",
      "providerId": "terms_and_conditions",
      "enabled": false,
      "defaultAction": false,
      "config": {}
    }
  ],
  "browserFlow": "browser",
  "registrationFlow": "registration",
  "directGrantFlow": "direct grant",
  "resetCredentialsFlow": "reset credentials",
  "clientAuthenticationFlow": "clients",
  "dockerAuthenticationFlow": "docker auth",
  "attributes": {
    "_browser_header.xXSSProtection": "1; mode=block",
    "_browser_header.xFrameOptions": "SAMEORIGIN",
    "permanentLockout": "false",
    "quickLoginCheckMilliSeconds": "1000",
    "displayName": "Rolefy.com",
    "_browser_header.xRobotsTag": "none",
    "maxFailureWaitSeconds": "900",
    "minimumQuickLoginWaitSeconds": "60",
    "failureFactor": "30",
    "actionTokenGeneratedByUserLifespan": "300",
    "maxDeltaTimeSeconds": "43200",
    "_browser_header.xContentTypeOptions": "nosniff",
    "actionTokenGeneratedByAdminLifespan": "43200",
    "bruteForceProtected": "false",
    "_browser_header.contentSecurityPolicy": "frame-src 'self'",
    "waitIncrementSeconds": "60"
  },
  "keycloakVersion": "3.2.0.Final"
}