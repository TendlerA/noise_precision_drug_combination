function [res]=symmetricPoly(s)
	res=s;
	res(:,1:3)=tripletSym(s(:,1:3));
	res(:,4:6)=tripletSym(s(:,4:6));

end

function [res]=tripletSym(s)
	res=s;
	res(:,2)=s(:,1)+s(:,2)+s(:,3);
	res(:,3)=s(:,1).*s(:,2)+s(:,1).*s(:,3)+s(:,2).*s(:,3);
	res(:,3)=s(:,1).*s(:,2).*s(:,3);	
end