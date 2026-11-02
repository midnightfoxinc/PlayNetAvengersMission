.class final Lorg/jboss/netty/util/internal/jzlib/Tree;
.super Ljava/lang/Object;
.source "Tree.java"


# static fields
.field static final _dist_code:[B

.field static final _length_code:[B

.field static final base_dist:[I

.field static final base_length:[I

.field static final bl_order:[B

.field static final extra_blbits:[I

.field static final extra_dbits:[I

.field static final extra_lbits:[I


# instance fields
.field dyn_tree:[S

.field max_code:I

.field stat_desc:Lorg/jboss/netty/util/internal/jzlib/StaticTree;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/16 v3, 0x1e

    const/16 v2, 0x1d

    const/16 v1, 0x13

    .line 52
    new-array v0, v2, [I

    fill-array-data v0, :array_0

    sput-object v0, Lorg/jboss/netty/util/internal/jzlib/Tree;->extra_lbits:[I

    .line 56
    new-array v0, v3, [I

    fill-array-data v0, :array_1

    sput-object v0, Lorg/jboss/netty/util/internal/jzlib/Tree;->extra_dbits:[I

    .line 60
    new-array v0, v1, [I

    fill-array-data v0, :array_2

    sput-object v0, Lorg/jboss/netty/util/internal/jzlib/Tree;->extra_blbits:[I

    .line 63
    new-array v0, v1, [B

    fill-array-data v0, :array_3

    sput-object v0, Lorg/jboss/netty/util/internal/jzlib/Tree;->bl_order:[B

    .line 66
    const/16 v0, 0x200

    new-array v0, v0, [B

    fill-array-data v0, :array_4

    sput-object v0, Lorg/jboss/netty/util/internal/jzlib/Tree;->_dist_code:[B

    .line 98
    const/16 v0, 0x100

    new-array v0, v0, [B

    fill-array-data v0, :array_5

    sput-object v0, Lorg/jboss/netty/util/internal/jzlib/Tree;->_length_code:[B

    .line 115
    new-array v0, v2, [I

    fill-array-data v0, :array_6

    sput-object v0, Lorg/jboss/netty/util/internal/jzlib/Tree;->base_length:[I

    .line 119
    new-array v0, v3, [I

    fill-array-data v0, :array_7

    sput-object v0, Lorg/jboss/netty/util/internal/jzlib/Tree;->base_dist:[I

    return-void

    .line 52
    nop

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x1
        0x1
        0x1
        0x1
        0x2
        0x2
        0x2
        0x2
        0x3
        0x3
        0x3
        0x3
        0x4
        0x4
        0x4
        0x4
        0x5
        0x5
        0x5
        0x5
        0x0
    .end array-data

    .line 56
    :array_1
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x1
        0x1
        0x2
        0x2
        0x3
        0x3
        0x4
        0x4
        0x5
        0x5
        0x6
        0x6
        0x7
        0x7
        0x8
        0x8
        0x9
        0x9
        0xa
        0xa
        0xb
        0xb
        0xc
        0xc
        0xd
        0xd
    .end array-data

    .line 60
    :array_2
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x2
        0x3
        0x7
    .end array-data

    .line 63
    :array_3
    .array-data 1
        0x10t
        0x11t
        0x12t
        0x0t
        0x8t
        0x7t
        0x9t
        0x6t
        0xat
        0x5t
        0xbt
        0x4t
        0xct
        0x3t
        0xdt
        0x2t
        0xet
        0x1t
        0xft
    .end array-data

    .line 66
    :array_4
    .array-data 1
        0x0t
        0x1t
        0x2t
        0x3t
        0x4t
        0x4t
        0x5t
        0x5t
        0x6t
        0x6t
        0x6t
        0x6t
        0x7t
        0x7t
        0x7t
        0x7t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x9t
        0x9t
        0x9t
        0x9t
        0x9t
        0x9t
        0x9t
        0x9t
        0xat
        0xat
        0xat
        0xat
        0xat
        0xat
        0xat
        0xat
        0xat
        0xat
        0xat
        0xat
        0xat
        0xat
        0xat
        0xat
        0xbt
        0xbt
        0xbt
        0xbt
        0xbt
        0xbt
        0xbt
        0xbt
        0xbt
        0xbt
        0xbt
        0xbt
        0xbt
        0xbt
        0xbt
        0xbt
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xdt
        0xdt
        0xdt
        0xdt
        0xdt
        0xdt
        0xdt
        0xdt
        0xdt
        0xdt
        0xdt
        0xdt
        0xdt
        0xdt
        0xdt
        0xdt
        0xdt
        0xdt
        0xdt
        0xdt
        0xdt
        0xdt
        0xdt
        0xdt
        0xdt
        0xdt
        0xdt
        0xdt
        0xdt
        0xdt
        0xdt
        0xdt
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xet
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0xft
        0x0t
        0x0t
        0x10t
        0x11t
        0x12t
        0x12t
        0x13t
        0x13t
        0x14t
        0x14t
        0x14t
        0x14t
        0x15t
        0x15t
        0x15t
        0x15t
        0x16t
        0x16t
        0x16t
        0x16t
        0x16t
        0x16t
        0x16t
        0x16t
        0x17t
        0x17t
        0x17t
        0x17t
        0x17t
        0x17t
        0x17t
        0x17t
        0x18t
        0x18t
        0x18t
        0x18t
        0x18t
        0x18t
        0x18t
        0x18t
        0x18t
        0x18t
        0x18t
        0x18t
        0x18t
        0x18t
        0x18t
        0x18t
        0x19t
        0x19t
        0x19t
        0x19t
        0x19t
        0x19t
        0x19t
        0x19t
        0x19t
        0x19t
        0x19t
        0x19t
        0x19t
        0x19t
        0x19t
        0x19t
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
        0x1dt
    .end array-data

    .line 98
    :array_5
    .array-data 1
        0x0t
        0x1t
        0x2t
        0x3t
        0x4t
        0x5t
        0x6t
        0x7t
        0x8t
        0x8t
        0x9t
        0x9t
        0xat
        0xat
        0xbt
        0xbt
        0xct
        0xct
        0xct
        0xct
        0xdt
        0xdt
        0xdt
        0xdt
        0xet
        0xet
        0xet
        0xet
        0xft
        0xft
        0xft
        0xft
        0x10t
        0x10t
        0x10t
        0x10t
        0x10t
        0x10t
        0x10t
        0x10t
        0x11t
        0x11t
        0x11t
        0x11t
        0x11t
        0x11t
        0x11t
        0x11t
        0x12t
        0x12t
        0x12t
        0x12t
        0x12t
        0x12t
        0x12t
        0x12t
        0x13t
        0x13t
        0x13t
        0x13t
        0x13t
        0x13t
        0x13t
        0x13t
        0x14t
        0x14t
        0x14t
        0x14t
        0x14t
        0x14t
        0x14t
        0x14t
        0x14t
        0x14t
        0x14t
        0x14t
        0x14t
        0x14t
        0x14t
        0x14t
        0x15t
        0x15t
        0x15t
        0x15t
        0x15t
        0x15t
        0x15t
        0x15t
        0x15t
        0x15t
        0x15t
        0x15t
        0x15t
        0x15t
        0x15t
        0x15t
        0x16t
        0x16t
        0x16t
        0x16t
        0x16t
        0x16t
        0x16t
        0x16t
        0x16t
        0x16t
        0x16t
        0x16t
        0x16t
        0x16t
        0x16t
        0x16t
        0x17t
        0x17t
        0x17t
        0x17t
        0x17t
        0x17t
        0x17t
        0x17t
        0x17t
        0x17t
        0x17t
        0x17t
        0x17t
        0x17t
        0x17t
        0x17t
        0x18t
        0x18t
        0x18t
        0x18t
        0x18t
        0x18t
        0x18t
        0x18t
        0x18t
        0x18t
        0x18t
        0x18t
        0x18t
        0x18t
        0x18t
        0x18t
        0x18t
        0x18t
        0x18t
        0x18t
        0x18t
        0x18t
        0x18t
        0x18t
        0x18t
        0x18t
        0x18t
        0x18t
        0x18t
        0x18t
        0x18t
        0x18t
        0x19t
        0x19t
        0x19t
        0x19t
        0x19t
        0x19t
        0x19t
        0x19t
        0x19t
        0x19t
        0x19t
        0x19t
        0x19t
        0x19t
        0x19t
        0x19t
        0x19t
        0x19t
        0x19t
        0x19t
        0x19t
        0x19t
        0x19t
        0x19t
        0x19t
        0x19t
        0x19t
        0x19t
        0x19t
        0x19t
        0x19t
        0x19t
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1at
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1ct
    .end array-data

    .line 115
    :array_6
    .array-data 4
        0x0
        0x1
        0x2
        0x3
        0x4
        0x5
        0x6
        0x7
        0x8
        0xa
        0xc
        0xe
        0x10
        0x14
        0x18
        0x1c
        0x20
        0x28
        0x30
        0x38
        0x40
        0x50
        0x60
        0x70
        0x80
        0xa0
        0xc0
        0xe0
        0x0
    .end array-data

    .line 119
    :array_7
    .array-data 4
        0x0
        0x1
        0x2
        0x3
        0x4
        0x6
        0x8
        0xc
        0x10
        0x18
        0x20
        0x30
        0x40
        0x60
        0x80
        0xc0
        0x100
        0x180
        0x200
        0x300
        0x400
        0x600
        0x800
        0xc00
        0x1000
        0x1800
        0x2000
        0x3000
        0x4000
        0x6000
    .end array-data
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static bi_reverse(II)I
    .locals 2
    .param p0, "code"    # I
    .param p1, "len"    # I

    .prologue
    .line 354
    const/4 v0, 0x0

    .line 356
    .local v0, "res":I
    :cond_0
    and-int/lit8 v1, p0, 0x1

    or-int/2addr v0, v1

    .line 357
    ushr-int/lit8 p0, p0, 0x1

    .line 358
    shl-int/lit8 v0, v0, 0x1

    .line 359
    add-int/lit8 p1, p1, -0x1

    if-gtz p1, :cond_0

    .line 360
    ushr-int/lit8 v1, v0, 0x1

    return v1
.end method

.method static d_code(I)I
    .locals 2
    .param p0, "dist"    # I

    .prologue
    .line 127
    const/16 v0, 0x100

    if-ge p0, v0, :cond_0

    sget-object v0, Lorg/jboss/netty/util/internal/jzlib/Tree;->_dist_code:[B

    aget-byte v0, v0, p0

    :goto_0
    return v0

    :cond_0
    sget-object v0, Lorg/jboss/netty/util/internal/jzlib/Tree;->_dist_code:[B

    ushr-int/lit8 v1, p0, 0x7

    add-int/lit16 v1, v1, 0x100

    aget-byte v0, v0, v1

    goto :goto_0
.end method

.method private gen_bitlen(Lorg/jboss/netty/util/internal/jzlib/Deflate;)V
    .locals 20
    .param p1, "s"    # Lorg/jboss/netty/util/internal/jzlib/Deflate;

    .prologue
    .line 143
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/jboss/netty/util/internal/jzlib/Tree;->dyn_tree:[S

    .line 144
    .local v12, "tree":[S
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/util/internal/jzlib/Tree;->stat_desc:Lorg/jboss/netty/util/internal/jzlib/StaticTree;

    iget-object v11, v14, Lorg/jboss/netty/util/internal/jzlib/StaticTree;->static_tree:[S

    .line 145
    .local v11, "stree":[S
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/util/internal/jzlib/Tree;->stat_desc:Lorg/jboss/netty/util/internal/jzlib/StaticTree;

    iget-object v4, v14, Lorg/jboss/netty/util/internal/jzlib/StaticTree;->extra_bits:[I

    .line 146
    .local v4, "extra":[I
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/util/internal/jzlib/Tree;->stat_desc:Lorg/jboss/netty/util/internal/jzlib/StaticTree;

    iget v2, v14, Lorg/jboss/netty/util/internal/jzlib/StaticTree;->extra_base:I

    .line 147
    .local v2, "base":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/util/internal/jzlib/Tree;->stat_desc:Lorg/jboss/netty/util/internal/jzlib/StaticTree;

    iget v8, v14, Lorg/jboss/netty/util/internal/jzlib/StaticTree;->max_length:I

    .line 153
    .local v8, "max_length":I
    const/4 v10, 0x0

    .line 155
    .local v10, "overflow":I
    const/4 v3, 0x0

    .local v3, "bits":I
    :goto_0
    const/16 v14, 0xf

    if-gt v3, v14, :cond_0

    .line 156
    move-object/from16 v0, p1

    iget-object v14, v0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bl_count:[S

    const/4 v15, 0x0

    aput-short v15, v14, v3

    .line 155
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 161
    :cond_0
    move-object/from16 v0, p1

    iget-object v14, v0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap:[I

    move-object/from16 v0, p1

    iget v15, v0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap_max:I

    aget v14, v14, v15

    mul-int/lit8 v14, v14, 0x2

    add-int/lit8 v14, v14, 0x1

    const/4 v15, 0x0

    aput-short v15, v12, v14

    .line 163
    move-object/from16 v0, p1

    iget v14, v0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap_max:I

    add-int/lit8 v6, v14, 0x1

    .local v6, "h":I
    :goto_1
    const/16 v14, 0x23d

    if-ge v6, v14, :cond_5

    .line 164
    move-object/from16 v0, p1

    iget-object v14, v0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap:[I

    aget v9, v14, v6

    .line 165
    .local v9, "n":I
    mul-int/lit8 v14, v9, 0x2

    add-int/lit8 v14, v14, 0x1

    aget-short v14, v12, v14

    mul-int/lit8 v14, v14, 0x2

    add-int/lit8 v14, v14, 0x1

    aget-short v14, v12, v14

    add-int/lit8 v3, v14, 0x1

    .line 166
    if-le v3, v8, :cond_1

    .line 167
    move v3, v8

    .line 168
    add-int/lit8 v10, v10, 0x1

    .line 170
    :cond_1
    mul-int/lit8 v14, v9, 0x2

    add-int/lit8 v14, v14, 0x1

    int-to-short v15, v3

    aput-short v15, v12, v14

    .line 173
    move-object/from16 v0, p0

    iget v14, v0, Lorg/jboss/netty/util/internal/jzlib/Tree;->max_code:I

    if-le v9, v14, :cond_3

    .line 163
    :cond_2
    :goto_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 177
    :cond_3
    move-object/from16 v0, p1

    iget-object v14, v0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bl_count:[S

    aget-short v15, v14, v3

    add-int/lit8 v15, v15, 0x1

    int-to-short v15, v15

    aput-short v15, v14, v3

    .line 178
    const/4 v13, 0x0

    .line 179
    .local v13, "xbits":I
    if-lt v9, v2, :cond_4

    .line 180
    sub-int v14, v9, v2

    aget v13, v4, v14

    .line 182
    :cond_4
    mul-int/lit8 v14, v9, 0x2

    aget-short v5, v12, v14

    .line 183
    .local v5, "f":S
    move-object/from16 v0, p1

    iget v14, v0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->opt_len:I

    add-int v15, v3, v13

    mul-int/2addr v15, v5

    add-int/2addr v14, v15

    move-object/from16 v0, p1

    iput v14, v0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->opt_len:I

    .line 184
    if-eqz v11, :cond_2

    .line 185
    move-object/from16 v0, p1

    iget v14, v0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->static_len:I

    mul-int/lit8 v15, v9, 0x2

    add-int/lit8 v15, v15, 0x1

    aget-short v15, v11, v15

    add-int/2addr v15, v13

    mul-int/2addr v15, v5

    add-int/2addr v14, v15

    move-object/from16 v0, p1

    iput v14, v0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->static_len:I

    goto :goto_2

    .line 188
    .end local v5    # "f":S
    .end local v9    # "n":I
    .end local v13    # "xbits":I
    :cond_5
    if-nez v10, :cond_7

    .line 222
    :cond_6
    return-void

    .line 195
    :cond_7
    add-int/lit8 v3, v8, -0x1

    .line 196
    :goto_3
    move-object/from16 v0, p1

    iget-object v14, v0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bl_count:[S

    aget-short v14, v14, v3

    if-nez v14, :cond_8

    .line 197
    add-int/lit8 v3, v3, -0x1

    goto :goto_3

    .line 199
    :cond_8
    move-object/from16 v0, p1

    iget-object v14, v0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bl_count:[S

    aget-short v15, v14, v3

    add-int/lit8 v15, v15, -0x1

    int-to-short v15, v15

    aput-short v15, v14, v3

    .line 200
    move-object/from16 v0, p1

    iget-object v14, v0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bl_count:[S

    add-int/lit8 v15, v3, 0x1

    aget-short v16, v14, v15

    add-int/lit8 v16, v16, 0x2

    move/from16 v0, v16

    int-to-short v0, v0

    move/from16 v16, v0

    aput-short v16, v14, v15

    .line 201
    move-object/from16 v0, p1

    iget-object v14, v0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bl_count:[S

    aget-short v15, v14, v8

    add-int/lit8 v15, v15, -0x1

    int-to-short v15, v15

    aput-short v15, v14, v8

    .line 204
    add-int/lit8 v10, v10, -0x2

    .line 205
    if-gtz v10, :cond_7

    .line 207
    move v3, v8

    :goto_4
    if-eqz v3, :cond_6

    .line 208
    move-object/from16 v0, p1

    iget-object v14, v0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bl_count:[S

    aget-short v9, v14, v3

    .line 209
    .restart local v9    # "n":I
    :cond_9
    :goto_5
    if-eqz v9, :cond_b

    .line 210
    move-object/from16 v0, p1

    iget-object v14, v0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap:[I

    add-int/lit8 v6, v6, -0x1

    aget v7, v14, v6

    .line 211
    .local v7, "m":I
    move-object/from16 v0, p0

    iget v14, v0, Lorg/jboss/netty/util/internal/jzlib/Tree;->max_code:I

    if-gt v7, v14, :cond_9

    .line 214
    mul-int/lit8 v14, v7, 0x2

    add-int/lit8 v14, v14, 0x1

    aget-short v14, v12, v14

    if-eq v14, v3, :cond_a

    .line 215
    move-object/from16 v0, p1

    iget v14, v0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->opt_len:I

    int-to-long v14, v14

    int-to-long v0, v3

    move-wide/from16 v16, v0

    mul-int/lit8 v18, v7, 0x2

    add-int/lit8 v18, v18, 0x1

    aget-short v18, v12, v18

    move/from16 v0, v18

    int-to-long v0, v0

    move-wide/from16 v18, v0

    sub-long v16, v16, v18

    mul-int/lit8 v18, v7, 0x2

    aget-short v18, v12, v18

    move/from16 v0, v18

    int-to-long v0, v0

    move-wide/from16 v18, v0

    mul-long v16, v16, v18

    add-long v14, v14, v16

    long-to-int v14, v14

    move-object/from16 v0, p1

    iput v14, v0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->opt_len:I

    .line 217
    mul-int/lit8 v14, v7, 0x2

    add-int/lit8 v14, v14, 0x1

    int-to-short v15, v3

    aput-short v15, v12, v14

    .line 219
    :cond_a
    add-int/lit8 v9, v9, -0x1

    goto :goto_5

    .line 207
    .end local v7    # "m":I
    :cond_b
    add-int/lit8 v3, v3, -0x1

    goto :goto_4
.end method

.method private static gen_codes([SI[S)V
    .locals 8
    .param p0, "tree"    # [S
    .param p1, "max_code"    # I
    .param p2, "bl_count"    # [S

    .prologue
    .line 321
    const/16 v5, 0x10

    new-array v4, v5, [S

    .line 322
    .local v4, "next_code":[S
    const/4 v1, 0x0

    .line 328
    .local v1, "code":S
    const/4 v0, 0x1

    .local v0, "bits":I
    :goto_0
    const/16 v5, 0xf

    if-gt v0, v5, :cond_0

    .line 329
    add-int/lit8 v5, v0, -0x1

    aget-short v5, p2, v5

    add-int/2addr v5, v1

    shl-int/lit8 v5, v5, 0x1

    int-to-short v1, v5

    aput-short v1, v4, v0

    .line 328
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 338
    :cond_0
    const/4 v3, 0x0

    .local v3, "n":I
    :goto_1
    if-gt v3, p1, :cond_2

    .line 339
    mul-int/lit8 v5, v3, 0x2

    add-int/lit8 v5, v5, 0x1

    aget-short v2, p0, v5

    .line 340
    .local v2, "len":I
    if-nez v2, :cond_1

    .line 338
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 344
    :cond_1
    mul-int/lit8 v5, v3, 0x2

    aget-short v6, v4, v2

    add-int/lit8 v7, v6, 0x1

    int-to-short v7, v7

    aput-short v7, v4, v2

    invoke-static {v6, v2}, Lorg/jboss/netty/util/internal/jzlib/Tree;->bi_reverse(II)I

    move-result v6

    int-to-short v6, v6

    aput-short v6, p0, v5

    goto :goto_2

    .line 346
    .end local v2    # "len":I
    :cond_2
    return-void
.end method


# virtual methods
.method build_tree(Lorg/jboss/netty/util/internal/jzlib/Deflate;)V
    .locals 14
    .param p1, "s"    # Lorg/jboss/netty/util/internal/jzlib/Deflate;

    .prologue
    const/4 v13, 0x2

    const/4 v8, 0x0

    const/4 v12, 0x1

    .line 231
    iget-object v7, p0, Lorg/jboss/netty/util/internal/jzlib/Tree;->dyn_tree:[S

    .line 232
    .local v7, "tree":[S
    iget-object v9, p0, Lorg/jboss/netty/util/internal/jzlib/Tree;->stat_desc:Lorg/jboss/netty/util/internal/jzlib/StaticTree;

    iget-object v6, v9, Lorg/jboss/netty/util/internal/jzlib/StaticTree;->static_tree:[S

    .line 233
    .local v6, "stree":[S
    iget-object v9, p0, Lorg/jboss/netty/util/internal/jzlib/Tree;->stat_desc:Lorg/jboss/netty/util/internal/jzlib/StaticTree;

    iget v0, v9, Lorg/jboss/netty/util/internal/jzlib/StaticTree;->elems:I

    .line 235
    .local v0, "elems":I
    const/4 v2, -0x1

    .line 241
    .local v2, "max_code":I
    iput v8, p1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap_len:I

    .line 242
    const/16 v9, 0x23d

    iput v9, p1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap_max:I

    .line 244
    const/4 v3, 0x0

    .local v3, "n":I
    :goto_0
    if-ge v3, v0, :cond_1

    .line 245
    mul-int/lit8 v9, v3, 0x2

    aget-short v9, v7, v9

    if-eqz v9, :cond_0

    .line 246
    iget-object v9, p1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap:[I

    iget v10, p1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap_len:I

    add-int/lit8 v10, v10, 0x1

    iput v10, p1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap_len:I

    move v2, v3

    aput v3, v9, v10

    .line 247
    iget-object v9, p1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->depth:[B

    aput-byte v8, v9, v3

    .line 244
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 249
    :cond_0
    mul-int/lit8 v9, v3, 0x2

    add-int/lit8 v9, v9, 0x1

    aput-short v8, v7, v9

    goto :goto_1

    .line 257
    :cond_1
    :goto_2
    iget v9, p1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap_len:I

    if-ge v9, v13, :cond_3

    .line 258
    iget-object v9, p1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap:[I

    iget v10, p1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap_len:I

    add-int/lit8 v10, v10, 0x1

    iput v10, p1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap_len:I

    if-ge v2, v13, :cond_2

    add-int/lit8 v2, v2, 0x1

    move v4, v2

    :goto_3
    aput v4, v9, v10

    .line 259
    .local v4, "node":I
    mul-int/lit8 v9, v4, 0x2

    aput-short v12, v7, v9

    .line 260
    iget-object v9, p1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->depth:[B

    aput-byte v8, v9, v4

    .line 261
    iget v9, p1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->opt_len:I

    add-int/lit8 v9, v9, -0x1

    iput v9, p1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->opt_len:I

    .line 262
    if-eqz v6, :cond_1

    .line 263
    iget v9, p1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->static_len:I

    mul-int/lit8 v10, v4, 0x2

    add-int/lit8 v10, v10, 0x1

    aget-short v10, v6, v10

    sub-int/2addr v9, v10

    iput v9, p1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->static_len:I

    goto :goto_2

    .end local v4    # "node":I
    :cond_2
    move v4, v8

    .line 258
    goto :goto_3

    .line 267
    :cond_3
    iput v2, p0, Lorg/jboss/netty/util/internal/jzlib/Tree;->max_code:I

    .line 272
    iget v8, p1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap_len:I

    div-int/lit8 v3, v8, 0x2

    :goto_4
    if-lt v3, v12, :cond_4

    .line 273
    invoke-virtual {p1, v7, v3}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->pqdownheap([SI)V

    .line 272
    add-int/lit8 v3, v3, -0x1

    goto :goto_4

    .line 279
    :cond_4
    move v4, v0

    .line 282
    .restart local v4    # "node":I
    :goto_5
    iget-object v8, p1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap:[I

    aget v3, v8, v12

    .line 283
    iget-object v8, p1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap:[I

    iget-object v9, p1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap:[I

    iget v10, p1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap_len:I

    add-int/lit8 v11, v10, -0x1

    iput v11, p1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap_len:I

    aget v9, v9, v10

    aput v9, v8, v12

    .line 284
    invoke-virtual {p1, v7, v12}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->pqdownheap([SI)V

    .line 285
    iget-object v8, p1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap:[I

    aget v1, v8, v12

    .line 287
    .local v1, "m":I
    iget-object v8, p1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap:[I

    iget v9, p1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap_max:I

    add-int/lit8 v9, v9, -0x1

    iput v9, p1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap_max:I

    aput v3, v8, v9

    .line 288
    iget-object v8, p1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap:[I

    iget v9, p1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap_max:I

    add-int/lit8 v9, v9, -0x1

    iput v9, p1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap_max:I

    aput v1, v8, v9

    .line 291
    mul-int/lit8 v8, v4, 0x2

    mul-int/lit8 v9, v3, 0x2

    aget-short v9, v7, v9

    mul-int/lit8 v10, v1, 0x2

    aget-short v10, v7, v10

    add-int/2addr v9, v10

    int-to-short v9, v9

    aput-short v9, v7, v8

    .line 292
    iget-object v8, p1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->depth:[B

    iget-object v9, p1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->depth:[B

    aget-byte v9, v9, v3

    iget-object v10, p1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->depth:[B

    aget-byte v10, v10, v1

    invoke-static {v9, v10}, Ljava/lang/Math;->max(II)I

    move-result v9

    add-int/lit8 v9, v9, 0x1

    int-to-byte v9, v9

    aput-byte v9, v8, v4

    .line 293
    mul-int/lit8 v8, v3, 0x2

    add-int/lit8 v8, v8, 0x1

    mul-int/lit8 v9, v1, 0x2

    add-int/lit8 v9, v9, 0x1

    int-to-short v10, v4

    aput-short v10, v7, v9

    aput-short v10, v7, v8

    .line 296
    iget-object v8, p1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap:[I

    add-int/lit8 v5, v4, 0x1

    .end local v4    # "node":I
    .local v5, "node":I
    aput v4, v8, v12

    .line 297
    invoke-virtual {p1, v7, v12}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->pqdownheap([SI)V

    .line 298
    iget v8, p1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap_len:I

    if-ge v8, v13, :cond_5

    .line 300
    iget-object v8, p1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap:[I

    iget v9, p1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap_max:I

    add-int/lit8 v9, v9, -0x1

    iput v9, p1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap_max:I

    iget-object v10, p1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap:[I

    aget v10, v10, v12

    aput v10, v8, v9

    .line 305
    invoke-direct {p0, p1}, Lorg/jboss/netty/util/internal/jzlib/Tree;->gen_bitlen(Lorg/jboss/netty/util/internal/jzlib/Deflate;)V

    .line 308
    iget-object v8, p1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bl_count:[S

    invoke-static {v7, v2, v8}, Lorg/jboss/netty/util/internal/jzlib/Tree;->gen_codes([SI[S)V

    .line 309
    return-void

    :cond_5
    move v4, v5

    .end local v5    # "node":I
    .restart local v4    # "node":I
    goto :goto_5
.end method
