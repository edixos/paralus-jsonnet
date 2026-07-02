
local claims = std.extVar('claims');

local fName =
  if "given_name" in claims && claims.given_name != null
  then claims.given_name
  else claims.name;

local lName =
  if "family_name" in claims && claims.family_name != null
  then claims.family_name
  else "";

{
  identity: {
    traits: {
      email: claims.email,

      // Using it as first_name unless given_name/family_name are available.
      first_name: fName,
      last_name: lName,

      username: claims.name,

      [if "groups" in claims then "idp_groups" else null]: claims.groups,
    },
  },
}
