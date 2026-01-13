# Identity and Security Services in Azure
Sections:
1. Identity Types: Understand the difference between Users, Groups, and Workload Identities (for apps).
2. Authentication: Learn how to configure MFA and Self-Service Password Reset (SSPR).
3. RBAC (Role-Based Access Control): Learn how to assign specific permissions using built-in roles like "Application Administrator".
4. Conditional Access: Study how to create "If-Then" security policies (e.g., "If the user is outside the office, then require MFA").

## 1. Identity Types
https://learn.microsoft.com/en-us/training/modules/explore-basic-services-identity-types/
### What is Microsoft Entra ID?
- Microsoft Entra ID, formerly Azure Active Directory, is Microsoft’s cloud-based identity and access management service.
- enable employees, guests, and others to sign in and access the resources they need, including:
  - Internal resources, such as apps on your corporate network and intranet, and cloud apps developed by your own 
  organization.
  - External services, such as Microsoft Office 365, the Azure portal, and any SaaS applications used by your 
  organization.
- provides single identity system for cloud and on-premises applications.
- also allows organizations to securely enable the use of personal devices, such as mobiles and tablets, and enable collaboration with business partners and customers.

### Basic terminology
- Tenant - A Microsoft Entra tenant is an instance of Microsoft Entra ID in which information about a single 
organization resides including organizational objects such as users, groups, devices, and application registrations. 
A tenant also contains access and compliance policies for resources, such as applications registered in the directory. 
Each Microsoft Entra tenant has a unique ID (tenant ID) and a domain name (for example, contoso.onmicrosoft.com) and 
serves as a security and administrative boundary, allowing the organization to manage and control access to resources, 
applications, devices, and services.

- Directory - The terms Microsoft Entra directory and Microsoft Entra tenant are often used interchangeably. 
The directory is a logical container within a Microsoft Entra tenant that holds and organizes the various resources 
and objects related to identity and access management including users, groups, applications, devices, and other 
directory objects. Basically, the directory is like a database or catalog of identities and resources associated with 
an organization's tenant. A Microsoft Entra tenant consists of only one directory.

- Multi-tenant - A multi-tenant organization is an organization that has more than one instance of Microsoft Entra ID. Reasons why an organization might have multiple tenants include organizations with multiple subsidiaries or business units that operate independently, organizations that merge or acquire companies, multiple geographical boundaries with various residency regulations, and more.
