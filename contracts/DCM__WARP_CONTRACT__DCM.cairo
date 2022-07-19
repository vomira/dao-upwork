%lang starknet

from warplib.memory import (
    wm_alloc,
    wm_read_felt,
    wm_read_256,
    wm_read_id,
    wm_dyn_array_length,
    wm_new,
    wm_index_dyn,
)
from starkware.cairo.common.dict import dict_write, dict_read
from starkware.cairo.common.dict_access import DictAccess
from starkware.cairo.common.uint256 import Uint256, uint256_sub, uint256_add, uint256_lt, uint256_eq
from starkware.cairo.common.alloc import alloc
from warplib.maths.utils import narrow_safe, felt_to_uint256
from warplib.maths.bytes_conversions import warp_bytes_widen
from warplib.maths.external_input_check_address import warp_external_input_check_address
from starkware.cairo.common.cairo_builtins import HashBuiltin, BitwiseBuiltin
from starkware.cairo.common.default_dict import default_dict_new, default_dict_finalize
from starkware.starknet.common.syscalls import get_caller_address

struct Escrow_19827e01:
    member __warp_usrid0_escrowId : Uint256
    member __warp_usrid1_amount : Uint256
    member __warp_usrid2_projectId : Uint256
    member __warp_usrid3_projectStartDate : Uint256
    member __warp_usrid4_projectEndDate : Uint256
    member __warp_usrid5_payer : felt
    member __warp_usrid6_payee : felt
end

struct DAO_a41d13f9:
    member __warp_usrid0_name : felt
    member __warp_usrid1_description : felt
    member __warp_usrid2_uniqueAddress : felt
    member __warp_usrid3_numBounties : Uint256
end

struct Contributor_677b22f5:
    member __warp_usrid4_user : felt
    member __warp_usrid5_name : felt
    member __warp_usrid6_description : felt
    member __warp_usrid7_linkedIn : felt
    member __warp_usrid8_github : felt
    member __warp_usrid9_avgRatePerHour : Uint256
    member __warp_usrid10_numProjects : Uint256
end

struct Project_fc606694:
    member __warp_usrid11_id : Uint256
    member __warp_usrid12_name : felt
    member __warp_usrid13_description : felt
    member __warp_usrid14_maxCompensation : Uint256
    member __warp_usrid15_startDate : Uint256
    member __warp_usrid16_endDate : Uint256
    member __warp_usrid17_dao : felt
    member __warp_usrid18_user : felt
    member __warp_usrid19_status : felt
end

struct cd_dynarray_felt:
    member len : felt
    member ptr : felt*
end

func WM0_struct_Contributor_677b22f5{range_check_ptr, warp_memory : DictAccess*}(
    __warp_usrid4_user : felt,
    __warp_usrid5_name : felt,
    __warp_usrid6_description : felt,
    __warp_usrid7_linkedIn : felt,
    __warp_usrid8_github : felt,
    __warp_usrid9_avgRatePerHour : Uint256,
    __warp_usrid10_numProjects : Uint256,
) -> (res):
    alloc_locals
    let (start) = wm_alloc(Uint256(0x9, 0x0))
    dict_write{dict_ptr=warp_memory}(start, __warp_usrid4_user)
    dict_write{dict_ptr=warp_memory}(start + 1, __warp_usrid5_name)
    dict_write{dict_ptr=warp_memory}(start + 2, __warp_usrid6_description)
    dict_write{dict_ptr=warp_memory}(start + 3, __warp_usrid7_linkedIn)
    dict_write{dict_ptr=warp_memory}(start + 4, __warp_usrid8_github)
    dict_write{dict_ptr=warp_memory}(start + 5, __warp_usrid9_avgRatePerHour.low)
    dict_write{dict_ptr=warp_memory}(start + 6, __warp_usrid9_avgRatePerHour.high)
    dict_write{dict_ptr=warp_memory}(start + 7, __warp_usrid10_numProjects.low)
    dict_write{dict_ptr=warp_memory}(start + 8, __warp_usrid10_numProjects.high)
    return (start)
end

func WM1_struct_Project_fc606694{range_check_ptr, warp_memory : DictAccess*}(
    __warp_usrid11_id : Uint256,
    __warp_usrid12_name : felt,
    __warp_usrid13_description : felt,
    __warp_usrid14_maxCompensation : Uint256,
    __warp_usrid15_startDate : Uint256,
    __warp_usrid16_endDate : Uint256,
    __warp_usrid17_dao : felt,
    __warp_usrid18_user : felt,
    __warp_usrid19_status : felt,
) -> (res):
    alloc_locals
    let (start) = wm_alloc(Uint256(0xd, 0x0))
    dict_write{dict_ptr=warp_memory}(start, __warp_usrid11_id.low)
    dict_write{dict_ptr=warp_memory}(start + 1, __warp_usrid11_id.high)
    dict_write{dict_ptr=warp_memory}(start + 2, __warp_usrid12_name)
    dict_write{dict_ptr=warp_memory}(start + 3, __warp_usrid13_description)
    dict_write{dict_ptr=warp_memory}(start + 4, __warp_usrid14_maxCompensation.low)
    dict_write{dict_ptr=warp_memory}(start + 5, __warp_usrid14_maxCompensation.high)
    dict_write{dict_ptr=warp_memory}(start + 6, __warp_usrid15_startDate.low)
    dict_write{dict_ptr=warp_memory}(start + 7, __warp_usrid15_startDate.high)
    dict_write{dict_ptr=warp_memory}(start + 8, __warp_usrid16_endDate.low)
    dict_write{dict_ptr=warp_memory}(start + 9, __warp_usrid16_endDate.high)
    dict_write{dict_ptr=warp_memory}(start + 10, __warp_usrid17_dao)
    dict_write{dict_ptr=warp_memory}(start + 11, __warp_usrid18_user)
    dict_write{dict_ptr=warp_memory}(start + 12, __warp_usrid19_status)
    return (start)
end

func wm_to_calldata0{
    syscall_ptr : felt*,
    pedersen_ptr : HashBuiltin*,
    range_check_ptr : felt,
    warp_memory : DictAccess*,
}(mem_loc : felt) -> (retData : cd_dynarray_felt):
    alloc_locals
    let (len_256) = wm_read_256(mem_loc)
    let (ptr : felt*) = alloc()
    let (len_felt) = narrow_safe(len_256)
    wm_to_calldata1(len_felt, ptr, mem_loc + 2)
    return (cd_dynarray_felt(len=len_felt, ptr=ptr))
end

func wm_to_calldata1{
    syscall_ptr : felt*,
    pedersen_ptr : HashBuiltin*,
    range_check_ptr : felt,
    warp_memory : DictAccess*,
}(len : felt, ptr : felt*, mem_loc : felt) -> ():
    alloc_locals
    if len == 0:
        return ()
    end
    let (mem_read0) = wm_read_felt(mem_loc)
    assert ptr[0] = mem_read0
    wm_to_calldata1(len=len - 1, ptr=ptr + 1, mem_loc=mem_loc + 1)
    return ()
end

func wm_to_storage0{
    syscall_ptr : felt*,
    pedersen_ptr : HashBuiltin*,
    range_check_ptr : felt,
    warp_memory : DictAccess*,
}(loc : felt, mem_loc : felt) -> (loc : felt):
    alloc_locals
    let (elem_mem_loc_0) = dict_read{dict_ptr=warp_memory}(mem_loc)
    WARP_STORAGE.write(loc, elem_mem_loc_0)
    let (elem_mem_loc_1) = wm_read_id(mem_loc + 1, Uint256(0x2, 0x0))
    let (storage_dyn_array_loc) = readId(loc + 1)
    wm_to_storage1(storage_dyn_array_loc, elem_mem_loc_1)
    let (elem_mem_loc_2) = wm_read_id(mem_loc + 2, Uint256(0x2, 0x0))
    let (storage_dyn_array_loc) = readId(loc + 2)
    wm_to_storage1(storage_dyn_array_loc, elem_mem_loc_2)
    let (elem_mem_loc_3) = wm_read_id(mem_loc + 3, Uint256(0x2, 0x0))
    let (storage_dyn_array_loc) = readId(loc + 3)
    wm_to_storage1(storage_dyn_array_loc, elem_mem_loc_3)
    let (elem_mem_loc_4) = wm_read_id(mem_loc + 4, Uint256(0x2, 0x0))
    let (storage_dyn_array_loc) = readId(loc + 4)
    wm_to_storage1(storage_dyn_array_loc, elem_mem_loc_4)
    let (elem_mem_loc_5) = dict_read{dict_ptr=warp_memory}(mem_loc + 5)
    WARP_STORAGE.write(loc + 5, elem_mem_loc_5)
    let (elem_mem_loc_6) = dict_read{dict_ptr=warp_memory}(mem_loc + 6)
    WARP_STORAGE.write(loc + 6, elem_mem_loc_6)
    let (elem_mem_loc_7) = dict_read{dict_ptr=warp_memory}(mem_loc + 7)
    WARP_STORAGE.write(loc + 7, elem_mem_loc_7)
    let (elem_mem_loc_8) = dict_read{dict_ptr=warp_memory}(mem_loc + 8)
    WARP_STORAGE.write(loc + 8, elem_mem_loc_8)
    return (loc)
end

func wm_to_storage1_elem{
    syscall_ptr : felt*,
    pedersen_ptr : HashBuiltin*,
    range_check_ptr : felt,
    warp_memory : DictAccess*,
}(storage_name : felt, mem_loc : felt, length : Uint256) -> ():
    alloc_locals
    if length.low == 0:
        if length.high == 0:
            return ()
        end
    end
    let (index) = uint256_sub(length, Uint256(1, 0))
    let (storage_loc) = WARP_DARRAY0_felt.read(storage_name, index)
    let mem_loc = mem_loc - 1
    if storage_loc == 0:
        let (storage_loc) = WARP_USED_STORAGE.read()
        WARP_USED_STORAGE.write(storage_loc + 1)
        WARP_DARRAY0_felt.write(storage_name, index, storage_loc)
        let (copy) = dict_read{dict_ptr=warp_memory}(mem_loc)
        WARP_STORAGE.write(storage_loc, copy)
        return wm_to_storage1_elem(storage_name, mem_loc, index)
    else:
        let (copy) = dict_read{dict_ptr=warp_memory}(mem_loc)
        WARP_STORAGE.write(storage_loc, copy)
        return wm_to_storage1_elem(storage_name, mem_loc, index)
    end
end
func wm_to_storage1{
    syscall_ptr : felt*,
    pedersen_ptr : HashBuiltin*,
    range_check_ptr : felt,
    warp_memory : DictAccess*,
}(loc : felt, mem_loc : felt) -> (loc : felt):
    alloc_locals
    let (length) = WARP_DARRAY0_felt_LENGTH.read(loc)
    let (mem_length) = wm_dyn_array_length(mem_loc)
    WARP_DARRAY0_felt_LENGTH.write(loc, mem_length)
    let (narrowedLength) = narrow_safe(mem_length)
    wm_to_storage1_elem(loc, mem_loc + 2 + 1 * narrowedLength, mem_length)
    let (lesser) = uint256_lt(mem_length, length)
    if lesser == 1:
        WS0_DYNAMIC_ARRAY_DELETE_elem(loc, mem_length, length)
        return (loc)
    else:
        return (loc)
    end
end

func wm_to_storage2{
    syscall_ptr : felt*,
    pedersen_ptr : HashBuiltin*,
    range_check_ptr : felt,
    warp_memory : DictAccess*,
}(loc : felt, mem_loc : felt) -> (loc : felt):
    alloc_locals
    let (elem_mem_loc_0) = dict_read{dict_ptr=warp_memory}(mem_loc)
    WARP_STORAGE.write(loc, elem_mem_loc_0)
    let (elem_mem_loc_1) = dict_read{dict_ptr=warp_memory}(mem_loc + 1)
    WARP_STORAGE.write(loc + 1, elem_mem_loc_1)
    let (elem_mem_loc_2) = wm_read_id(mem_loc + 2, Uint256(0x2, 0x0))
    let (storage_dyn_array_loc) = readId(loc + 2)
    wm_to_storage1(storage_dyn_array_loc, elem_mem_loc_2)
    let (elem_mem_loc_3) = wm_read_id(mem_loc + 3, Uint256(0x2, 0x0))
    let (storage_dyn_array_loc) = readId(loc + 3)
    wm_to_storage1(storage_dyn_array_loc, elem_mem_loc_3)
    let (elem_mem_loc_4) = dict_read{dict_ptr=warp_memory}(mem_loc + 4)
    WARP_STORAGE.write(loc + 4, elem_mem_loc_4)
    let (elem_mem_loc_5) = dict_read{dict_ptr=warp_memory}(mem_loc + 5)
    WARP_STORAGE.write(loc + 5, elem_mem_loc_5)
    let (elem_mem_loc_6) = dict_read{dict_ptr=warp_memory}(mem_loc + 6)
    WARP_STORAGE.write(loc + 6, elem_mem_loc_6)
    let (elem_mem_loc_7) = dict_read{dict_ptr=warp_memory}(mem_loc + 7)
    WARP_STORAGE.write(loc + 7, elem_mem_loc_7)
    let (elem_mem_loc_8) = dict_read{dict_ptr=warp_memory}(mem_loc + 8)
    WARP_STORAGE.write(loc + 8, elem_mem_loc_8)
    let (elem_mem_loc_9) = dict_read{dict_ptr=warp_memory}(mem_loc + 9)
    WARP_STORAGE.write(loc + 9, elem_mem_loc_9)
    let (elem_mem_loc_10) = dict_read{dict_ptr=warp_memory}(mem_loc + 10)
    WARP_STORAGE.write(loc + 10, elem_mem_loc_10)
    let (elem_mem_loc_11) = dict_read{dict_ptr=warp_memory}(mem_loc + 11)
    WARP_STORAGE.write(loc + 11, elem_mem_loc_11)
    let (elem_mem_loc_12) = dict_read{dict_ptr=warp_memory}(mem_loc + 12)
    WARP_STORAGE.write(loc + 12, elem_mem_loc_12)
    return (loc)
end

func WS0_DYNAMIC_ARRAY_DELETE_elem{
    syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt
}(loc : felt, index : Uint256, length : Uint256):
    alloc_locals
    let (stop) = uint256_eq(index, length)
    if stop == 1:
        return ()
    end
    let (elem_loc) = WARP_DARRAY0_felt.read(loc, index)
    WS1_DELETE(elem_loc)
    let (next_index, _) = uint256_add(index, Uint256(0x1, 0x0))
    return WS0_DYNAMIC_ARRAY_DELETE_elem(loc, next_index, length)
end
func WS0_DYNAMIC_ARRAY_DELETE{
    syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt
}(loc : felt):
    alloc_locals
    let (length) = WARP_DARRAY0_felt_LENGTH.read(loc)
    WARP_DARRAY0_felt_LENGTH.write(loc, Uint256(0x0, 0x0))
    return WS0_DYNAMIC_ARRAY_DELETE_elem(loc, Uint256(0x0, 0x0), length)
end

func WS1_DELETE{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(
    loc : felt
):
    WARP_STORAGE.write(loc, 0)
    return ()
end

func WARP_DARRAY1_Contributor_677b22f5_PUSHV0{
    syscall_ptr : felt*,
    pedersen_ptr : HashBuiltin*,
    range_check_ptr : felt,
    bitwise_ptr : BitwiseBuiltin*,
}(loc : felt, value : felt) -> ():
    alloc_locals
    let (len) = WARP_DARRAY1_Contributor_677b22f5_LENGTH.read(loc)
    let (newLen, carry) = uint256_add(len, Uint256(1, 0))
    assert carry = 0
    WARP_DARRAY1_Contributor_677b22f5_LENGTH.write(loc, newLen)
    let (existing) = WARP_DARRAY1_Contributor_677b22f5.read(loc, len)
    if (existing) == 0:
        let (used) = WARP_USED_STORAGE.read()
        WARP_USED_STORAGE.write(used + 9)
        WARP_DARRAY1_Contributor_677b22f5.write(loc, len, used)
        ws_copy0(used, value)
    else:
        ws_copy0(existing, value)
    end
    return ()
end

func WARP_DARRAY2_Project_fc606694_PUSHV1{
    syscall_ptr : felt*,
    pedersen_ptr : HashBuiltin*,
    range_check_ptr : felt,
    bitwise_ptr : BitwiseBuiltin*,
}(loc : felt, value : felt) -> ():
    alloc_locals
    let (len) = WARP_DARRAY2_Project_fc606694_LENGTH.read(loc)
    let (newLen, carry) = uint256_add(len, Uint256(1, 0))
    assert carry = 0
    WARP_DARRAY2_Project_fc606694_LENGTH.write(loc, newLen)
    let (existing) = WARP_DARRAY2_Project_fc606694.read(loc, len)
    if (existing) == 0:
        let (used) = WARP_USED_STORAGE.read()
        WARP_USED_STORAGE.write(used + 13)
        WARP_DARRAY2_Project_fc606694.write(loc, len, used)
        ws_copy3(used, value)
    else:
        ws_copy3(existing, value)
    end
    return ()
end

func WSM0_Contributor_677b22f5___warp_usrid5_name(loc : felt) -> (memberLoc : felt):
    return (loc + 1)
end

func WSM1_Contributor_677b22f5___warp_usrid6_description(loc : felt) -> (memberLoc : felt):
    return (loc + 2)
end

func WSM2_Contributor_677b22f5___warp_usrid9_avgRatePerHour(loc : felt) -> (memberLoc : felt):
    return (loc + 5)
end

func WSM3_Project_fc606694___warp_usrid11_id(loc : felt) -> (memberLoc : felt):
    return (loc)
end

func WSM4_Project_fc606694___warp_usrid14_maxCompensation(loc : felt) -> (memberLoc : felt):
    return (loc + 4)
end

func WSM5_Project_fc606694___warp_usrid17_dao(loc : felt) -> (memberLoc : felt):
    return (loc + 10)
end

func WSM6_Project_fc606694___warp_usrid18_user(loc : felt) -> (memberLoc : felt):
    return (loc + 11)
end

func WS0_READ_warp_id{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(
    loc : felt
) -> (val : felt):
    alloc_locals
    let (read0) = readId(loc)
    return (read0)
end

func WS1_READ_Uint256{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(
    loc : felt
) -> (val : Uint256):
    alloc_locals
    let (read0) = WARP_STORAGE.read(loc)
    let (read1) = WARP_STORAGE.read(loc + 1)
    return (Uint256(low=read0, high=read1))
end

func WS2_READ_felt{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(
    loc : felt
) -> (val : felt):
    alloc_locals
    let (read0) = WARP_STORAGE.read(loc)
    return (read0)
end

func ws_to_memory0_elem{
    syscall_ptr : felt*,
    pedersen_ptr : HashBuiltin*,
    range_check_ptr : felt,
    warp_memory : DictAccess*,
}(storage_name : felt, mem_start : felt, length : Uint256) -> ():
    alloc_locals
    if length.low == 0:
        if length.high == 0:
            return ()
        end
    end
    let (index) = uint256_sub(length, Uint256(1, 0))
    let (mem_loc) = wm_index_dyn(mem_start, index, Uint256(0x1, 0x0))
    let (element_storage_loc) = WARP_DARRAY0_felt.read(storage_name, index)
    let (copy) = WARP_STORAGE.read(element_storage_loc)
    dict_write{dict_ptr=warp_memory}(mem_loc, copy)
    return ws_to_memory0_elem(storage_name, mem_start, index)
end
func ws_to_memory0{
    syscall_ptr : felt*,
    pedersen_ptr : HashBuiltin*,
    range_check_ptr : felt,
    warp_memory : DictAccess*,
}(loc : felt) -> (mem_loc : felt):
    alloc_locals
    let (length : Uint256) = WARP_DARRAY0_felt_LENGTH.read(loc)
    let (mem_start) = wm_new(length, Uint256(0x1, 0x0))
    ws_to_memory0_elem(loc, mem_start, length)
    return (mem_start)
end

func ws_copy0{
    syscall_ptr : felt*,
    pedersen_ptr : HashBuiltin*,
    range_check_ptr : felt,
    bitwise_ptr : BitwiseBuiltin*,
}(to_loc : felt, from_loc : felt) -> (retLoc : felt):
    alloc_locals
    let (copy) = WARP_STORAGE.read(from_loc)
    WARP_STORAGE.write(to_loc, copy)
    ws_copy1(to_loc + 1, from_loc + 1)
    ws_copy1(to_loc + 2, from_loc + 2)
    ws_copy1(to_loc + 3, from_loc + 3)
    ws_copy1(to_loc + 4, from_loc + 4)
    let (copy) = WARP_STORAGE.read(from_loc + 5)
    WARP_STORAGE.write(to_loc + 5, copy)
    let (copy) = WARP_STORAGE.read(from_loc + 6)
    WARP_STORAGE.write(to_loc + 6, copy)
    let (copy) = WARP_STORAGE.read(from_loc + 7)
    WARP_STORAGE.write(to_loc + 7, copy)
    let (copy) = WARP_STORAGE.read(from_loc + 8)
    WARP_STORAGE.write(to_loc + 8, copy)
    return (to_loc)
end

func ws_copy1_elem{
    syscall_ptr : felt*,
    pedersen_ptr : HashBuiltin*,
    range_check_ptr : felt,
    bitwise_ptr : BitwiseBuiltin*,
}(to_loc : felt, from_loc : felt, length : Uint256) -> ():
    alloc_locals
    if length.low == 0:
        if length.high == 0:
            return ()
        end
    end
    let (index) = uint256_sub(length, Uint256(1, 0))
    let (from_elem_loc) = WARP_DARRAY0_felt.read(from_loc, index)
    let (to_elem_loc) = WARP_DARRAY0_felt.read(to_loc, index)
    if to_elem_loc == 0:
        let (to_elem_loc) = WARP_USED_STORAGE.read()
        WARP_USED_STORAGE.write(to_elem_loc + 1)
        WARP_DARRAY0_felt.write(to_loc, index, to_elem_loc)
        ws_copy2(to_elem_loc, from_elem_loc)
        return ws_copy1_elem(to_loc, from_loc, index)
    else:
        ws_copy2(to_elem_loc, from_elem_loc)
        return ws_copy1_elem(to_loc, from_loc, index)
    end
end
func ws_copy1{
    syscall_ptr : felt*,
    pedersen_ptr : HashBuiltin*,
    range_check_ptr : felt,
    bitwise_ptr : BitwiseBuiltin*,
}(to_loc : felt, from_loc : felt) -> (retLoc : felt):
    alloc_locals
    let (from_length) = WARP_DARRAY0_felt_LENGTH.read(from_loc)
    let (to_length) = WARP_DARRAY0_felt_LENGTH.read(to_loc)
    WARP_DARRAY0_felt_LENGTH.write(to_loc, from_length)
    ws_copy1_elem(to_loc, from_loc, from_length)
    let (lesser) = uint256_lt(from_length, to_length)
    if lesser == 1:
        WS0_DYNAMIC_ARRAY_DELETE_elem(to_loc, from_length, to_length)
        return (to_loc)
    else:
        return (to_loc)
    end
end

func ws_copy2{
    syscall_ptr : felt*,
    pedersen_ptr : HashBuiltin*,
    range_check_ptr : felt,
    bitwise_ptr : BitwiseBuiltin*,
}(to_loc : felt, from_loc : felt) -> (ret_loc : felt):
    alloc_locals
    let (from_elem) = WARP_STORAGE.read(from_loc)
    let to_elem = from_elem
    WARP_STORAGE.write(to_loc, to_elem)
    return (to_loc)
end

func ws_copy3{
    syscall_ptr : felt*,
    pedersen_ptr : HashBuiltin*,
    range_check_ptr : felt,
    bitwise_ptr : BitwiseBuiltin*,
}(to_loc : felt, from_loc : felt) -> (retLoc : felt):
    alloc_locals
    let (copy) = WARP_STORAGE.read(from_loc)
    WARP_STORAGE.write(to_loc, copy)
    let (copy) = WARP_STORAGE.read(from_loc + 1)
    WARP_STORAGE.write(to_loc + 1, copy)
    ws_copy1(to_loc + 2, from_loc + 2)
    ws_copy1(to_loc + 3, from_loc + 3)
    let (copy) = WARP_STORAGE.read(from_loc + 4)
    WARP_STORAGE.write(to_loc + 4, copy)
    let (copy) = WARP_STORAGE.read(from_loc + 5)
    WARP_STORAGE.write(to_loc + 5, copy)
    let (copy) = WARP_STORAGE.read(from_loc + 6)
    WARP_STORAGE.write(to_loc + 6, copy)
    let (copy) = WARP_STORAGE.read(from_loc + 7)
    WARP_STORAGE.write(to_loc + 7, copy)
    let (copy) = WARP_STORAGE.read(from_loc + 8)
    WARP_STORAGE.write(to_loc + 8, copy)
    let (copy) = WARP_STORAGE.read(from_loc + 9)
    WARP_STORAGE.write(to_loc + 9, copy)
    let (copy) = WARP_STORAGE.read(from_loc + 10)
    WARP_STORAGE.write(to_loc + 10, copy)
    let (copy) = WARP_STORAGE.read(from_loc + 11)
    WARP_STORAGE.write(to_loc + 11, copy)
    let (copy) = WARP_STORAGE.read(from_loc + 12)
    WARP_STORAGE.write(to_loc + 12, copy)
    return (to_loc)
end

func WS_WRITE0{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(
    loc : felt, value : Uint256
) -> (res : Uint256):
    WARP_STORAGE.write(loc, value.low)
    WARP_STORAGE.write(loc + 1, value.high)
    return (value)
end

func WS_WRITE1{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(
    loc : felt, value : felt
) -> (res : felt):
    WARP_STORAGE.write(loc, value)
    return (value)
end

func extern_input_check0{range_check_ptr : felt}(len : felt, ptr : felt*) -> ():
    alloc_locals
    if len == 0:
        return ()
    end
    #warp_external_input_check_int8(ptr[0])
    extern_input_check0(len=len - 1, ptr=ptr + 1)
    return ()
end

func cd_to_memory0_elem{
    syscall_ptr : felt*,
    pedersen_ptr : HashBuiltin*,
    range_check_ptr : felt,
    warp_memory : DictAccess*,
}(calldata : felt*, mem_start : felt, length : felt):
    alloc_locals
    if length == 0:
        return ()
    end
    dict_write{dict_ptr=warp_memory}(mem_start, calldata[0])
    return cd_to_memory0_elem(calldata + 1, mem_start + 1, length - 1)
end
func cd_to_memory0{
    syscall_ptr : felt*,
    pedersen_ptr : HashBuiltin*,
    range_check_ptr : felt,
    warp_memory : DictAccess*,
}(calldata : cd_dynarray_felt) -> (mem_loc : felt):
    alloc_locals
    let (len256) = felt_to_uint256(calldata.len)
    let (mem_start) = wm_new(len256, Uint256(0x1, 0x0))
    cd_to_memory0_elem(calldata.ptr, mem_start + 2, calldata.len)
    return (mem_start)
end

@storage_var
func WARP_DARRAY0_felt(name : felt, index : Uint256) -> (resLoc : felt):
end
@storage_var
func WARP_DARRAY0_felt_LENGTH(name : felt) -> (index : Uint256):
end

@storage_var
func WARP_DARRAY1_Contributor_677b22f5(name : felt, index : Uint256) -> (resLoc : felt):
end
@storage_var
func WARP_DARRAY1_Contributor_677b22f5_LENGTH(name : felt) -> (index : Uint256):
end

@storage_var
func WARP_DARRAY2_Project_fc606694(name : felt, index : Uint256) -> (resLoc : felt):
end
@storage_var
func WARP_DARRAY2_Project_fc606694_LENGTH(name : felt) -> (index : Uint256):
end

@storage_var
func WARP_MAPPING0(name : felt, index : felt) -> (resLoc : felt):
end
func WS0_INDEX_felt_to_Contributor_677b22f5{
    syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt
}(name : felt, index : felt) -> (res : felt):
    alloc_locals
    let (existing) = WARP_MAPPING0.read(name, index)
    if existing == 0:
        let (used) = WARP_USED_STORAGE.read()
        WARP_USED_STORAGE.write(used + 9)
        WARP_MAPPING0.write(name, index, used)
        return (used)
    else:
        return (existing)
    end
end

@storage_var
func WARP_MAPPING1(name : felt, index : Uint256) -> (resLoc : felt):
end
func WS1_INDEX_Uint256_to_Project_fc606694{
    syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt
}(name : felt, index : Uint256) -> (res : felt):
    alloc_locals
    let (existing) = WARP_MAPPING1.read(name, index)
    if existing == 0:
        let (used) = WARP_USED_STORAGE.read()
        WARP_USED_STORAGE.write(used + 13)
        WARP_MAPPING1.write(name, index, used)
        return (used)
    else:
        return (existing)
    end
end

@storage_var
func WARP_MAPPING2(name : felt, index : Uint256) -> (resLoc : felt):
end
func WS2_INDEX_Uint256_to_felt{
    syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt
}(name : felt, index : Uint256) -> (res : felt):
    alloc_locals
    let (existing) = WARP_MAPPING2.read(name, index)
    if existing == 0:
        let (used) = WARP_USED_STORAGE.read()
        WARP_USED_STORAGE.write(used + 1)
        WARP_MAPPING2.write(name, index, used)
        return (used)
    else:
        return (existing)
    end
end

@storage_var
func WARP_MAPPING3(name : felt, index : Uint256) -> (resLoc : felt):
end
func WS3_INDEX_Uint256_to_Uint256{
    syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt
}(name : felt, index : Uint256) -> (res : felt):
    alloc_locals
    let (existing) = WARP_MAPPING3.read(name, index)
    if existing == 0:
        let (used) = WARP_USED_STORAGE.read()
        WARP_USED_STORAGE.write(used + 2)
        WARP_MAPPING3.write(name, index, used)
        return (used)
    else:
        return (existing)
    end
end

# Contract Def DCM

@storage_var
func WARP_STORAGE(index : felt) -> (val : felt):
end
@storage_var
func WARP_USED_STORAGE() -> (val : felt):
end
@storage_var
func WARP_NAMEGEN() -> (name : felt):
end
func readId{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(
    loc : felt
) -> (val : felt):
    alloc_locals
    let (id) = WARP_STORAGE.read(loc)
    if id == 0:
        let (id) = WARP_NAMEGEN.read()
        WARP_NAMEGEN.write(id + 1)
        WARP_STORAGE.write(loc, id + 1)
        return (id + 1)
    else:
        return (id)
    end
end

namespace DCM:
    # Dynamic variables - Arrays and Maps

    const __warp_usrid22_contributors = 1

    const __warp_usrid23_projects = 2

    const __warp_usrid24_projectToEscrowMap = 3

    const __warp_usrid25_projectIdToEscrowId = 4

    const __warp_usrid26_projectIdToProjectMap = 5

    const __warp_usrid27_contributorIdToUserMap = 6

    # Static variables

    const __warp_usrid20__projectIds = 0

    const __warp_usrid21_escrow_contract_address = 2

    @constructor
    func constructor{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(
        __warp_usrid32_contract_addr : felt
    ):
        alloc_locals
        WARP_USED_STORAGE.write(9)
        WARP_NAMEGEN.write(6)

        warp_external_input_check_address(__warp_usrid32_contract_addr)

        WS_WRITE0(__warp_usrid20__projectIds, Uint256(low=0, high=0))

        WS_WRITE1(__warp_usrid21_escrow_contract_address, __warp_usrid32_contract_addr)

        return ()
    end

    @external
    func createContributor_283dcdbd{
        syscall_ptr : felt*,
        pedersen_ptr : HashBuiltin*,
        range_check_ptr : felt,
        bitwise_ptr : BitwiseBuiltin*,
    }(
        __warp_usrid33__name_len : felt,
        __warp_usrid33__name : felt*,
        __warp_usrid34__description_len : felt,
        __warp_usrid34__description : felt*,
        __warp_usrid35__linkedIn_len : felt,
        __warp_usrid35__linkedIn : felt*,
        __warp_usrid36__github_len : felt,
        __warp_usrid36__github : felt*,
        __warp_usrid37__averageRatePerHour : Uint256,
    ) -> (__warp_usrid38_ : felt):
        alloc_locals
        let (local warp_memory : DictAccess*) = default_dict_new(0)
        local warp_memory_start : DictAccess* = warp_memory
        dict_write{dict_ptr=warp_memory}(0, 1)
        with warp_memory:
            #warp_external_input_check_int256(__warp_usrid37__averageRatePerHour)

            extern_input_check0(__warp_usrid36__github_len, __warp_usrid36__github)

            extern_input_check0(__warp_usrid35__linkedIn_len, __warp_usrid35__linkedIn)

            extern_input_check0(__warp_usrid34__description_len, __warp_usrid34__description)

            extern_input_check0(__warp_usrid33__name_len, __warp_usrid33__name)

            local __warp_usrid36__github_dstruct : cd_dynarray_felt = cd_dynarray_felt(__warp_usrid36__github_len, __warp_usrid36__github)

            let (__warp_usrid36__github_mem) = cd_to_memory0(__warp_usrid36__github_dstruct)

            local __warp_usrid35__linkedIn_dstruct : cd_dynarray_felt = cd_dynarray_felt(__warp_usrid35__linkedIn_len, __warp_usrid35__linkedIn)

            let (__warp_usrid35__linkedIn_mem) = cd_to_memory0(__warp_usrid35__linkedIn_dstruct)

            local __warp_usrid34__description_dstruct : cd_dynarray_felt = cd_dynarray_felt(__warp_usrid34__description_len, __warp_usrid34__description)

            let (__warp_usrid34__description_mem) = cd_to_memory0(
                __warp_usrid34__description_dstruct
            )

            local __warp_usrid33__name_dstruct : cd_dynarray_felt = cd_dynarray_felt(__warp_usrid33__name_len, __warp_usrid33__name)

            let (__warp_usrid33__name_mem) = cd_to_memory0(__warp_usrid33__name_dstruct)

            let (__warp_se_0) = get_caller_address()

            let (__warp_se_1) = WS0_INDEX_felt_to_Contributor_677b22f5(
                __warp_usrid27_contributorIdToUserMap, __warp_se_0
            )

            let (__warp_se_2) = get_caller_address()

            let (__warp_se_3) = WM0_struct_Contributor_677b22f5(
                __warp_se_2,
                __warp_usrid33__name_mem,
                __warp_usrid34__description_mem,
                __warp_usrid35__linkedIn_mem,
                __warp_usrid36__github_mem,
                __warp_usrid37__averageRatePerHour,
                Uint256(low=0, high=0),
            )

            wm_to_storage0(__warp_se_1, __warp_se_3)

            let (__warp_se_4) = get_caller_address()

            let (__warp_se_5) = WS0_INDEX_felt_to_Contributor_677b22f5(
                __warp_usrid27_contributorIdToUserMap, __warp_se_4
            )

            WARP_DARRAY1_Contributor_677b22f5_PUSHV0(__warp_usrid22_contributors, __warp_se_5)

            let (__warp_se_6) = get_caller_address()

            default_dict_finalize(warp_memory_start, warp_memory, 0)

            return (__warp_se_6)
        end
    end

    func __warp_usrfn0_createProject{
        syscall_ptr : felt*,
        pedersen_ptr : HashBuiltin*,
        range_check_ptr : felt,
        bitwise_ptr : BitwiseBuiltin*,
        warp_memory : DictAccess*,
    }(
        __warp_usrid39__name : felt,
        __warp_usrid40__description : felt,
        __warp_usrid41__maxCompensation : Uint256,
        __warp_usrid42__startDate : Uint256,
        __warp_usrid43__endDate : Uint256,
        __warp_usrid44__dao : felt,
        __warp_usrid45__contributor : felt,
    ) -> (__warp_usrid46_ : Uint256):
        alloc_locals

        let (__warp_se_7) = WS1_READ_Uint256(__warp_usrid20__projectIds)

        let (__warp_se_8, _) = uint256_add(__warp_se_7, Uint256(low=1, high=0))

        WS_WRITE0(__warp_usrid20__projectIds, __warp_se_8)

        let (__warp_usrid47_projectId) = WS1_READ_Uint256(__warp_usrid20__projectIds)

        let (__warp_se_9) = WS1_INDEX_Uint256_to_Project_fc606694(
            __warp_usrid26_projectIdToProjectMap, __warp_usrid47_projectId
        )

        let (__warp_se_10) = WM1_struct_Project_fc606694(
            __warp_usrid47_projectId,
            __warp_usrid39__name,
            __warp_usrid40__description,
            __warp_usrid41__maxCompensation,
            __warp_usrid42__startDate,
            __warp_usrid43__endDate,
            __warp_usrid44__dao,
            __warp_usrid45__contributor,
            1,
        )

        wm_to_storage2(__warp_se_9, __warp_se_10)

        let (__warp_se_11) = WS1_INDEX_Uint256_to_Project_fc606694(
            __warp_usrid26_projectIdToProjectMap, __warp_usrid47_projectId
        )

        WARP_DARRAY2_Project_fc606694_PUSHV1(__warp_usrid23_projects, __warp_se_11)

        return (__warp_usrid47_projectId)
    end

    @external
    func inviteContributor_a94e1d7e{
        syscall_ptr : felt*,
        pedersen_ptr : HashBuiltin*,
        range_check_ptr : felt,
        bitwise_ptr : BitwiseBuiltin*,
    }(
        __warp_usrid48_contributor : felt,
        __warp_usrid49__name_len : felt,
        __warp_usrid49__name : felt*,
        __warp_usrid50__description_len : felt,
        __warp_usrid50__description : felt*,
        __warp_usrid51__maxCompensation : Uint256,
        __warp_usrid52__startDate : Uint256,
        __warp_usrid53__endDate : Uint256,
    ) -> ():
        alloc_locals
        let (local warp_memory : DictAccess*) = default_dict_new(0)
        local warp_memory_start : DictAccess* = warp_memory
        dict_write{dict_ptr=warp_memory}(0, 1)
        with warp_memory:
            #warp_external_input_check_int256(__warp_usrid53__endDate)

            #warp_external_input_check_int256(__warp_usrid52__startDate)

            #warp_external_input_check_int256(__warp_usrid51__maxCompensation)

            extern_input_check0(__warp_usrid50__description_len, __warp_usrid50__description)

            extern_input_check0(__warp_usrid49__name_len, __warp_usrid49__name)

            warp_external_input_check_address(__warp_usrid48_contributor)

            local __warp_usrid50__description_dstruct : cd_dynarray_felt = cd_dynarray_felt(__warp_usrid50__description_len, __warp_usrid50__description)

            let (__warp_usrid50__description_mem) = cd_to_memory0(
                __warp_usrid50__description_dstruct
            )

            local __warp_usrid49__name_dstruct : cd_dynarray_felt = cd_dynarray_felt(__warp_usrid49__name_len, __warp_usrid49__name)

            let (__warp_usrid49__name_mem) = cd_to_memory0(__warp_usrid49__name_dstruct)

            let (__warp_se_12) = get_caller_address()

            let (__warp_usrid54_projectId) = __warp_usrfn0_createProject(
                __warp_usrid49__name_mem,
                __warp_usrid50__description_mem,
                __warp_usrid51__maxCompensation,
                __warp_usrid52__startDate,
                __warp_usrid53__endDate,
                __warp_se_12,
                __warp_usrid48_contributor,
            )

            let (__warp_se_13) = WS2_INDEX_Uint256_to_felt(
                __warp_usrid24_projectToEscrowMap, __warp_usrid54_projectId
            )

            let (__warp_se_14) = WS2_READ_felt(__warp_usrid21_escrow_contract_address)

            WS_WRITE1(__warp_se_13, __warp_se_14)

            let (__warp_se_15) = WS2_READ_felt(__warp_usrid21_escrow_contract_address)

            let (__warp_se_16) = get_caller_address()

            let (__warp_usrid55_eId) = DCMEscrow_warped_interface.createEscrow_d35238f4(
                __warp_se_15,
                __warp_usrid51__maxCompensation,
                __warp_usrid54_projectId,
                __warp_usrid52__startDate,
                __warp_usrid53__endDate,
                __warp_usrid48_contributor,
                __warp_se_16,
            )

            let (__warp_se_17) = WS3_INDEX_Uint256_to_Uint256(
                __warp_usrid25_projectIdToEscrowId, __warp_usrid54_projectId
            )

            WS_WRITE0(__warp_se_17, __warp_usrid55_eId)

            default_dict_finalize(warp_memory_start, warp_memory, 0)

            return ()
        end
    end

    @external
    func approveProject_fc69d836{
        syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt
    }(__warp_usrid56_projectId : Uint256) -> ():
        alloc_locals

        #warp_external_input_check_int256(__warp_usrid56_projectId)

        let (__warp_se_18) = WS3_INDEX_Uint256_to_Uint256(
            __warp_usrid25_projectIdToEscrowId, __warp_usrid56_projectId
        )

        let (__warp_usrid57_eId) = WS1_READ_Uint256(__warp_se_18)

        let (__warp_se_19) = WS2_READ_felt(__warp_usrid21_escrow_contract_address)

        DCMEscrow_warped_interface.escrowSettle_7c3793f9(__warp_se_19, __warp_usrid57_eId)

        return ()
    end

    @view
    func getAllContributors_bcf74e3c{
        syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt
    }(__warp_usrid58__contributor : felt) -> (
        __warp_usrid59__len : felt,
        __warp_usrid59_ : felt*,
        __warp_usrid60__len : felt,
        __warp_usrid60_ : felt*,
        __warp_usrid61_ : Uint256,
    ):
        alloc_locals
        let (local warp_memory : DictAccess*) = default_dict_new(0)
        local warp_memory_start : DictAccess* = warp_memory
        dict_write{dict_ptr=warp_memory}(0, 1)
        with warp_memory:
            warp_external_input_check_address(__warp_usrid58__contributor)

            let (__warp_se_20) = WS0_INDEX_felt_to_Contributor_677b22f5(
                __warp_usrid27_contributorIdToUserMap, __warp_usrid58__contributor
            )

            let (__warp_se_21) = WSM0_Contributor_677b22f5___warp_usrid5_name(__warp_se_20)

            let (__warp_se_22) = WS0_READ_warp_id(__warp_se_21)

            let (__warp_usrid59_) = ws_to_memory0(__warp_se_22)

            let (__warp_se_23) = WS0_INDEX_felt_to_Contributor_677b22f5(
                __warp_usrid27_contributorIdToUserMap, __warp_usrid58__contributor
            )

            let (__warp_se_24) = WSM1_Contributor_677b22f5___warp_usrid6_description(__warp_se_23)

            let (__warp_se_25) = WS0_READ_warp_id(__warp_se_24)

            let (__warp_usrid60_) = ws_to_memory0(__warp_se_25)

            let (__warp_se_26) = WS0_INDEX_felt_to_Contributor_677b22f5(
                __warp_usrid27_contributorIdToUserMap, __warp_usrid58__contributor
            )

            let (__warp_se_27) = WSM2_Contributor_677b22f5___warp_usrid9_avgRatePerHour(
                __warp_se_26
            )

            let (__warp_usrid61_) = WS1_READ_Uint256(__warp_se_27)

            let (__warp_se_28) = wm_to_calldata0(__warp_usrid59_)

            let (__warp_se_29) = wm_to_calldata0(__warp_usrid60_)

            default_dict_finalize(warp_memory_start, warp_memory, 0)

            return (
                __warp_se_28.len,
                __warp_se_28.ptr,
                __warp_se_29.len,
                __warp_se_29.ptr,
                __warp_usrid61_,
            )
        end
    end

    @view
    func getProjectFromId_e84447d0{
        syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt
    }(__warp_usrid62_projectId : Uint256) -> (
        __warp_usrid63_ : Uint256,
        __warp_usrid64_ : Uint256,
        __warp_usrid65_ : felt,
        __warp_usrid66_ : felt,
    ):
        alloc_locals

        #warp_external_input_check_int256(__warp_usrid62_projectId)

        let (__warp_se_30) = WS1_INDEX_Uint256_to_Project_fc606694(
            __warp_usrid26_projectIdToProjectMap, __warp_usrid62_projectId
        )

        let (__warp_se_31) = WSM3_Project_fc606694___warp_usrid11_id(__warp_se_30)

        let (__warp_usrid63_) = WS1_READ_Uint256(__warp_se_31)

        let (__warp_se_32) = WS1_INDEX_Uint256_to_Project_fc606694(
            __warp_usrid26_projectIdToProjectMap, __warp_usrid62_projectId
        )

        let (__warp_se_33) = WSM4_Project_fc606694___warp_usrid14_maxCompensation(__warp_se_32)

        let (__warp_usrid64_) = WS1_READ_Uint256(__warp_se_33)

        let (__warp_se_34) = WS1_INDEX_Uint256_to_Project_fc606694(
            __warp_usrid26_projectIdToProjectMap, __warp_usrid62_projectId
        )

        let (__warp_se_35) = WSM5_Project_fc606694___warp_usrid17_dao(__warp_se_34)

        let (__warp_usrid65_) = WS2_READ_felt(__warp_se_35)

        let (__warp_se_36) = WS1_INDEX_Uint256_to_Project_fc606694(
            __warp_usrid26_projectIdToProjectMap, __warp_usrid62_projectId
        )

        let (__warp_se_37) = WSM6_Project_fc606694___warp_usrid18_user(__warp_se_36)

        let (__warp_usrid66_) = WS2_READ_felt(__warp_se_37)

        return (__warp_usrid63_, __warp_usrid64_, __warp_usrid65_, __warp_usrid66_)
    end
end

# Contract Def DCMEscrow@interface

@contract_interface
namespace DCMEscrow_warped_interface:
    func createEscrow_d35238f4(
        __warp_usrid13__amount : Uint256,
        __warp_usrid14__projectId : Uint256,
        __warp_usrid15__projectStartDate : Uint256,
        __warp_usrid16__projectEndDate : Uint256,
        __warp_usrid17__payee : felt,
        __warp_usrid18__payer : felt,
    ) -> (__warp_usrid19_ : Uint256):
    end

    func escrowSettle_7c3793f9(__warp_usrid20_eId : Uint256) -> ():
    end

    func getEscrow_7d19e596(__warp_usrid22_eId : Uint256) -> (__warp_usrid23_ : Escrow_19827e01):
    end
end

# Original soldity abi: ["constructor(address)","","createContributor(string,string,string,string,uint256)","inviteContributor(address,string,string,uint256,uint256,uint256)","approveProject(uint256)","getAllContributors(address)","getProjectFromId(uint256)"]
