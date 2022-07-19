%lang starknet

from warplib.memory import wm_alloc
from starkware.cairo.common.dict import dict_write, dict_read
from starkware.cairo.common.dict_access import DictAccess
from starkware.cairo.common.uint256 import Uint256, uint256_add
from warplib.maths.external_input_check_address import warp_external_input_check_address
from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.default_dict import default_dict_new, default_dict_finalize

struct Escrow_19827e01:
    member __warp_usrid0_escrowId : Uint256
    member __warp_usrid1_amount : Uint256
    member __warp_usrid2_projectId : Uint256
    member __warp_usrid3_projectStartDate : Uint256
    member __warp_usrid4_projectEndDate : Uint256
    member __warp_usrid5_payer : felt
    member __warp_usrid6_payee : felt
end

func WM0_struct_Escrow_19827e01{range_check_ptr, warp_memory : DictAccess*}(
    __warp_usrid0_escrowId : Uint256,
    __warp_usrid1_amount : Uint256,
    __warp_usrid2_projectId : Uint256,
    __warp_usrid3_projectStartDate : Uint256,
    __warp_usrid4_projectEndDate : Uint256,
    __warp_usrid5_payer : felt,
    __warp_usrid6_payee : felt,
) -> (res):
    alloc_locals
    let (start) = wm_alloc(Uint256(0xc, 0x0))
    dict_write{dict_ptr=warp_memory}(start, __warp_usrid0_escrowId.low)
    dict_write{dict_ptr=warp_memory}(start + 1, __warp_usrid0_escrowId.high)
    dict_write{dict_ptr=warp_memory}(start + 2, __warp_usrid1_amount.low)
    dict_write{dict_ptr=warp_memory}(start + 3, __warp_usrid1_amount.high)
    dict_write{dict_ptr=warp_memory}(start + 4, __warp_usrid2_projectId.low)
    dict_write{dict_ptr=warp_memory}(start + 5, __warp_usrid2_projectId.high)
    dict_write{dict_ptr=warp_memory}(start + 6, __warp_usrid3_projectStartDate.low)
    dict_write{dict_ptr=warp_memory}(start + 7, __warp_usrid3_projectStartDate.high)
    dict_write{dict_ptr=warp_memory}(start + 8, __warp_usrid4_projectEndDate.low)
    dict_write{dict_ptr=warp_memory}(start + 9, __warp_usrid4_projectEndDate.high)
    dict_write{dict_ptr=warp_memory}(start + 10, __warp_usrid5_payer)
    dict_write{dict_ptr=warp_memory}(start + 11, __warp_usrid6_payee)
    return (start)
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
    let (elem_mem_loc_1) = dict_read{dict_ptr=warp_memory}(mem_loc + 1)
    WARP_STORAGE.write(loc + 1, elem_mem_loc_1)
    let (elem_mem_loc_2) = dict_read{dict_ptr=warp_memory}(mem_loc + 2)
    WARP_STORAGE.write(loc + 2, elem_mem_loc_2)
    let (elem_mem_loc_3) = dict_read{dict_ptr=warp_memory}(mem_loc + 3)
    WARP_STORAGE.write(loc + 3, elem_mem_loc_3)
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
    return (loc)
end

func WSM0_Escrow_19827e01___warp_usrid5_payer(loc : felt) -> (memberLoc : felt):
    return (loc + 10)
end

func WSM1_Escrow_19827e01___warp_usrid6_payee(loc : felt) -> (memberLoc : felt):
    return (loc + 11)
end

func WSM2_Escrow_19827e01___warp_usrid1_amount(loc : felt) -> (memberLoc : felt):
    return (loc + 2)
end

func WS0_READ_Uint256{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(
    loc : felt
) -> (val : Uint256):
    alloc_locals
    let (read0) = WARP_STORAGE.read(loc)
    let (read1) = WARP_STORAGE.read(loc + 1)
    return (Uint256(low=read0, high=read1))
end

func WS1_READ_felt{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(
    loc : felt
) -> (val : felt):
    alloc_locals
    let (read0) = WARP_STORAGE.read(loc)
    return (read0)
end

func ws_struct_Escrow_19827e01_to_calldata{
    syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt
}(loc : felt) -> (struct_Escrow_19827e01 : Escrow_19827e01):
    alloc_locals
    let (member_0) = WS0_READ_Uint256(loc)
    let (member_1) = WS0_READ_Uint256(loc + 2)
    let (member_2) = WS0_READ_Uint256(loc + 4)
    let (member_3) = WS0_READ_Uint256(loc + 6)
    let (member_4) = WS0_READ_Uint256(loc + 8)
    let (member_5) = WS1_READ_felt(loc + 10)
    let (member_6) = WS1_READ_felt(loc + 11)
    return (Escrow_19827e01(member_0, member_1, member_2, member_3, member_4, member_5, member_6))
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

@storage_var
func WARP_MAPPING0(name : felt, index : Uint256) -> (resLoc : felt):
end
func WS0_INDEX_Uint256_to_Escrow_19827e01{
    syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt
}(name : felt, index : Uint256) -> (res : felt):
    alloc_locals
    let (existing) = WARP_MAPPING0.read(name, index)
    if existing == 0:
        let (used) = WARP_USED_STORAGE.read()
        WARP_USED_STORAGE.write(used + 12)
        WARP_MAPPING0.write(name, index, used)
        return (used)
    else:
        return (existing)
    end
end

# Contract Def DCMEscrow

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

namespace DCMEscrow:
    # Dynamic variables - Arrays and Maps

    const __warp_usrid9_idToEscrowMapping = 1

    # Static variables

    const __warp_usrid7__escrowIds = 0

    const __warp_usrid8_eth_contract_address = 2

    @constructor
    func constructor{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(
        __warp_usrid12_contract_addr : felt
    ):
        alloc_locals
        WARP_USED_STORAGE.write(4)
        WARP_NAMEGEN.write(1)

        warp_external_input_check_address(__warp_usrid12_contract_addr)

        WS_WRITE0(__warp_usrid7__escrowIds, Uint256(low=0, high=0))

        WS_WRITE1(__warp_usrid8_eth_contract_address, __warp_usrid12_contract_addr)

        return ()
    end

    @external
    func createEscrow_d35238f4{
        syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt
    }(
        __warp_usrid13__amount : Uint256,
        __warp_usrid14__projectId : Uint256,
        __warp_usrid15__projectStartDate : Uint256,
        __warp_usrid16__projectEndDate : Uint256,
        __warp_usrid17__payee : felt,
        __warp_usrid18__payer : felt,
    ) -> (__warp_usrid19_ : Uint256):
        alloc_locals
        let (local warp_memory : DictAccess*) = default_dict_new(0)
        local warp_memory_start : DictAccess* = warp_memory
        dict_write{dict_ptr=warp_memory}(0, 1)
        with warp_memory:
            warp_external_input_check_address(__warp_usrid18__payer)

            warp_external_input_check_address(__warp_usrid17__payee)

            #warp_external_input_check_int256(__warp_usrid16__projectEndDate)

            #warp_external_input_check_int256(__warp_usrid15__projectStartDate)

            #warp_external_input_check_int256(__warp_usrid14__projectId)

            #warp_external_input_check_int256(__warp_usrid13__amount)

            let (__warp_se_0) = WS0_READ_Uint256(__warp_usrid7__escrowIds)

            let (__warp_se_1, _) = uint256_add(__warp_se_0, Uint256(low=1, high=0))

            WS_WRITE0(__warp_usrid7__escrowIds, __warp_se_1)

            let (__warp_se_2) = WS0_READ_Uint256(__warp_usrid7__escrowIds)

            let (__warp_se_3) = WS0_INDEX_Uint256_to_Escrow_19827e01(
                __warp_usrid9_idToEscrowMapping, __warp_se_2
            )

            let (__warp_se_4) = WS0_READ_Uint256(__warp_usrid7__escrowIds)

            let (__warp_se_5) = WM0_struct_Escrow_19827e01(
                __warp_se_4,
                __warp_usrid13__amount,
                __warp_usrid14__projectId,
                __warp_usrid15__projectStartDate,
                __warp_usrid16__projectEndDate,
                __warp_usrid18__payer,
                __warp_usrid17__payee,
            )

            wm_to_storage0(__warp_se_3, __warp_se_5)

            let (__warp_se_6) = WS0_READ_Uint256(__warp_usrid7__escrowIds)

            default_dict_finalize(warp_memory_start, warp_memory, 0)

            return (__warp_se_6)
        end
    end

    @external
    func escrowSettle_7c3793f9{
        syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt
    }(__warp_usrid20_eId : Uint256) -> ():
        alloc_locals

        #warp_external_input_check_int256(__warp_usrid20_eId)

        let (__warp_usrid21_e) = WS0_INDEX_Uint256_to_Escrow_19827e01(
            __warp_usrid9_idToEscrowMapping, __warp_usrid20_eId
        )

        let (__warp_se_7) = WS1_READ_felt(__warp_usrid8_eth_contract_address)

        let (__warp_se_8) = WSM0_Escrow_19827e01___warp_usrid5_payer(__warp_usrid21_e)

        let (__warp_se_9) = WS1_READ_felt(__warp_se_8)

        let (__warp_se_10) = WSM1_Escrow_19827e01___warp_usrid6_payee(__warp_usrid21_e)

        let (__warp_se_11) = WS1_READ_felt(__warp_se_10)

        let (__warp_se_12) = WSM2_Escrow_19827e01___warp_usrid1_amount(__warp_usrid21_e)

        let (__warp_se_13) = WS0_READ_Uint256(__warp_se_12)

        IERC20_warped_interface.transferFrom_23b872dd(
            __warp_se_7, __warp_se_9, __warp_se_11, __warp_se_13
        )

        return ()
    end

    @view
    func getEscrow_7d19e596{
        syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt
    }(__warp_usrid22_eId : Uint256) -> (__warp_usrid23_ : Escrow_19827e01):
        alloc_locals

        #warp_external_input_check_int256(__warp_usrid22_eId)

        let (__warp_se_14) = WS0_INDEX_Uint256_to_Escrow_19827e01(
            __warp_usrid9_idToEscrowMapping, __warp_usrid22_eId
        )

        let (__warp_se_15) = ws_struct_Escrow_19827e01_to_calldata(__warp_se_14)

        return (__warp_se_15)
    end
end

# Contract Def IERC20@interface

@contract_interface
namespace IERC20_warped_interface:
    func mint_40c10f19(__warp_usrid0_to : felt, __warp_usrid1_amount : Uint256) -> (
        __warp_usrid2_ : felt
    ):
    end

    func balanceOf_70a08231(__warp_usrid3_account : felt) -> (__warp_usrid4_ : Uint256):
    end

    func decimals_313ce567() -> (__warp_usrid5_ : felt):
    end

    func transferFrom_23b872dd(
        __warp_usrid6_sender : felt, __warp_usrid7_recipient : felt, __warp_usrid8_amount : Uint256
    ) -> (__warp_usrid9_ : felt):
    end
end

# Original soldity abi: ["constructor(address)","","createEscrow(uint256,uint256,uint256,uint256,address,address)","escrowSettle(uint256)","getEscrow(uint256)"]
