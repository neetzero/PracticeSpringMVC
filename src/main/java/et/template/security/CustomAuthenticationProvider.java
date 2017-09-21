package et.template.security;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;

public class CustomAuthenticationProvider implements AuthenticationProvider {

	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		//String name = authentication.getName();
        //String password = authentication.getCredentials().toString();
        
        //if (shouldAuthenticateAgainstThirdPartySystem()) {
 
            // use the credentials
            // and authenticate against the third-party system
          //  return new UsernamePasswordAuthenticationToken(
//              name, password, new ArrayList<>());
//        } else {
            return null;
//        }
	}

	public boolean supports(Class<?> authentication) {
		 return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

}
