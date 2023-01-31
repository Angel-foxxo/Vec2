//-----------------------------------------------------------------------
//  Uses a normal Vector() for its operations instead of reimplementing 
//  everything in order to improve performance since the Vector() class
//  is implemented in c++
//-----------------------------------------------------------------------
class Vec2
{
    vec = Vector(0, 0, 0);
    x = 0.0;
    y = 0.0;

    constructor(c_x, c_y)
    {
        vec = Vector(c_x, c_y, 0);
        x = vec.x;
        y = vec.y;
    }

    function _get(i)
	{
		switch(i)
		{
			case 0: return x;
			case 1: return y;
		}
		return rawget(i)
	}

	function _set(i,v)
	{
		switch(i)
		{
			case 0: try{return x = v.vec}catch(error){return x = v}
			case 0: try{return y = v.vec}catch(error){return y = v}
		}
		return rawset(i,v)
	}

    function _tostring()
    {
        return format("(vec2 : (%f, %f))", x, y);
    }

    function _typeof()
    {
        return "Vec2";
    }

    function _nexti(i)
    {
        switch(i)
		{
			case null: return 0;
			case 0: return 1;
		}
    }

    function _add(v)
    {
        try
        {
            return Vec2((vec + v.vec).x, (vec + v.vec).y);
        }
        catch(error)
        {
            return Vec2((vec + v).x, (vec + v).y);
        }
    }

    function _sub(v)
    {
        try
        {
            return Vec2((vec - v.vec).x, (vec - v.vec).y);
        }
        catch(error)
        {
            return Vec2((vec - v).x, (vec - v).y);
        }
    }

    function _mul(v)
    {
        try
        {
            return Vec2((vec * v.vec).x, (vec * v.vec).y);
        }
        catch(error)
        {
            return Vec2((vec * v).x, (vec * v).y);
        }
    }

    function ToKVString()
    {
        return format("%f %f", x, y);
    }

    function Length()
    {
        return vec.Length2D();
    }

    function LengthSqr()
    {
        return vec.Length2DSqr();
    }

    function Dot(v)
    {
        return vec.Dot(v.vec);
    }

    function Cross(v)
    {
        return (x * v.y) - (y * v.x);
    }

    function Norm()
    {
        local returnVal = vec.Norm();
        x = vec.x;
        y = vec.y;
        return returnVal;
    }
}

getroottable().Vec2 <- Vec2;