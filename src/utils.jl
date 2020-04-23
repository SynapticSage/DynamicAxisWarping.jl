Base.@propagate_inbounds Base.getindex(v::AbstractVector, ::typeof(!), i::Int) = v[i]
Base.@propagate_inbounds Base.getindex(v::AbstractMatrix, ::typeof(!), i::Int) = @view v[:,i]
Base.@propagate_inbounds Base.getindex(v::AbstractArray{<:Any,3}, ::typeof(!), i::Int) = @view v[:,:,i]

Base.@propagate_inbounds Base.setindex!(v::AbstractVector, val, ::typeof(!), i::Int) = v[i] = val
Base.@propagate_inbounds Base.setindex!(v::AbstractMatrix, val, ::typeof(!), i::Int) = v[:,i] .= val
Base.@propagate_inbounds Base.setindex!(v::AbstractArray{<:Any,3}, val, ::typeof(!), i::Int) = v[:,:,i] .= val

lastlength(x) = size(x, ndims(x))

@inline function indmin3(a,b,c,i,j)
    if a <= b
        if a <= c
            return 1,i-1,j-1
        else
            return 3,i,j-1
        end
    else
        if b <= c
            return 2,i-1,j
        else
            return 3,i,j-1
        end
    end
end
