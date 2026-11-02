.class final Lorg/jboss/netty/util/internal/jzlib/InfBlocks;
.super Ljava/lang/Object;
.source "InfBlocks.java"


# static fields
.field private static final BAD:I = 0x9

.field private static final BTREE:I = 0x4

.field private static final CODES:I = 0x6

.field private static final DONE:I = 0x8

.field private static final DRY:I = 0x7

.field private static final DTREE:I = 0x5

.field private static final LENS:I = 0x1

.field private static final STORED:I = 0x2

.field private static final TABLE:I = 0x3

.field private static final TYPE:I

.field private static final border:[I

.field private static final inflate_mask:[I


# instance fields
.field private final bb:[I

.field bitb:I

.field bitk:I

.field private blens:[I

.field private check:J

.field private final checkfn:Ljava/lang/Object;

.field private final codes:Lorg/jboss/netty/util/internal/jzlib/InfCodes;

.field final end:I

.field private hufts:[I

.field private index:I

.field private final inftree:Lorg/jboss/netty/util/internal/jzlib/InfTree;

.field private last:I

.field private left:I

.field private mode:I

.field read:I

.field private table:I

.field private final tb:[I

.field window:[B

.field write:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 53
    const/16 v0, 0x11

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inflate_mask:[I

    .line 59
    const/16 v0, 0x13

    new-array v0, v0, [I

    fill-array-data v0, :array_1

    sput-object v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->border:[I

    return-void

    .line 53
    nop

    :array_0
    .array-data 4
        0x0
        0x1
        0x3
        0x7
        0xf
        0x1f
        0x3f
        0x7f
        0xff
        0x1ff
        0x3ff
        0x7ff
        0xfff
        0x1fff
        0x3fff
        0x7fff
        0xffff
    .end array-data

    .line 59
    :array_1
    .array-data 4
        0x10
        0x11
        0x12
        0x0
        0x8
        0x7
        0x9
        0x6
        0xa
        0x5
        0xb
        0x4
        0xc
        0x3
        0xd
        0x2
        0xe
        0x1
        0xf
    .end array-data
.end method

.method constructor <init>(Lorg/jboss/netty/util/internal/jzlib/ZStream;Ljava/lang/Object;I)V
    .locals 2
    .param p1, "z"    # Lorg/jboss/netty/util/internal/jzlib/ZStream;
    .param p2, "checkfn"    # Ljava/lang/Object;
    .param p3, "w"    # I

    .prologue
    const/4 v1, 0x1

    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    new-array v0, v1, [I

    iput-object v0, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bb:[I

    .line 79
    new-array v0, v1, [I

    iput-object v0, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->tb:[I

    .line 80
    new-instance v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;

    invoke-direct {v0}, Lorg/jboss/netty/util/internal/jzlib/InfCodes;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->codes:Lorg/jboss/netty/util/internal/jzlib/InfCodes;

    .line 92
    new-instance v0, Lorg/jboss/netty/util/internal/jzlib/InfTree;

    invoke-direct {v0}, Lorg/jboss/netty/util/internal/jzlib/InfTree;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inftree:Lorg/jboss/netty/util/internal/jzlib/InfTree;

    .line 95
    const/16 v0, 0x10e0

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->hufts:[I

    .line 96
    new-array v0, p3, [B

    iput-object v0, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->window:[B

    .line 97
    iput p3, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->end:I

    .line 98
    iput-object p2, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->checkfn:Ljava/lang/Object;

    .line 99
    const/4 v0, 0x0

    iput v0, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->mode:I

    .line 100
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->reset(Lorg/jboss/netty/util/internal/jzlib/ZStream;[J)V

    .line 101
    return-void
.end method


# virtual methods
.method free(Lorg/jboss/netty/util/internal/jzlib/ZStream;)V
    .locals 1
    .param p1, "z"    # Lorg/jboss/netty/util/internal/jzlib/ZStream;

    .prologue
    const/4 v0, 0x0

    .line 614
    invoke-virtual {p0, p1, v0}, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->reset(Lorg/jboss/netty/util/internal/jzlib/ZStream;[J)V

    .line 615
    iput-object v0, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->window:[B

    .line 616
    iput-object v0, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->hufts:[I

    .line 618
    return-void
.end method

.method inflate_flush(Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I
    .locals 9
    .param p1, "z"    # Lorg/jboss/netty/util/internal/jzlib/ZStream;
    .param p2, "r"    # I

    .prologue
    const/4 v8, -0x5

    .line 638
    iget v1, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_out_index:I

    .line 639
    .local v1, "p":I
    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->read:I

    .line 642
    .local v2, "q":I
    iget v3, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    if-gt v2, v3, :cond_8

    iget v3, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    :goto_0
    sub-int v0, v3, v2

    .line 643
    .local v0, "n":I
    iget v3, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_out:I

    if-le v0, v3, :cond_0

    .line 644
    iget v0, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_out:I

    .line 646
    :cond_0
    if-eqz v0, :cond_1

    if-ne p2, v8, :cond_1

    .line 647
    const/4 p2, 0x0

    .line 651
    :cond_1
    iget v3, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_out:I

    sub-int/2addr v3, v0

    iput v3, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_out:I

    .line 652
    iget-wide v4, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_out:J

    int-to-long v6, v0

    add-long/2addr v4, v6

    iput-wide v4, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_out:J

    .line 655
    iget-object v3, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->checkfn:Ljava/lang/Object;

    if-eqz v3, :cond_2

    .line 656
    iget-wide v4, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->check:J

    iget-object v3, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->window:[B

    invoke-static {v4, v5, v3, v2, v0}, Lorg/jboss/netty/util/internal/jzlib/Adler32;->adler32(J[BII)J

    move-result-wide v4

    iput-wide v4, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->check:J

    iput-wide v4, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->adler:J

    .line 660
    :cond_2
    iget-object v3, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->window:[B

    iget-object v4, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_out:[B

    invoke-static {v3, v2, v4, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 661
    add-int/2addr v1, v0

    .line 662
    add-int/2addr v2, v0

    .line 665
    iget v3, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->end:I

    if-ne v2, v3, :cond_7

    .line 667
    const/4 v2, 0x0

    .line 668
    iget v3, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    iget v4, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->end:I

    if-ne v3, v4, :cond_3

    .line 669
    const/4 v3, 0x0

    iput v3, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 673
    :cond_3
    iget v3, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    sub-int v0, v3, v2

    .line 674
    iget v3, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_out:I

    if-le v0, v3, :cond_4

    .line 675
    iget v0, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_out:I

    .line 677
    :cond_4
    if-eqz v0, :cond_5

    if-ne p2, v8, :cond_5

    .line 678
    const/4 p2, 0x0

    .line 682
    :cond_5
    iget v3, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_out:I

    sub-int/2addr v3, v0

    iput v3, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_out:I

    .line 683
    iget-wide v4, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_out:J

    int-to-long v6, v0

    add-long/2addr v4, v6

    iput-wide v4, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_out:J

    .line 686
    iget-object v3, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->checkfn:Ljava/lang/Object;

    if-eqz v3, :cond_6

    .line 687
    iget-wide v4, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->check:J

    iget-object v3, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->window:[B

    invoke-static {v4, v5, v3, v2, v0}, Lorg/jboss/netty/util/internal/jzlib/Adler32;->adler32(J[BII)J

    move-result-wide v4

    iput-wide v4, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->check:J

    iput-wide v4, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->adler:J

    .line 691
    :cond_6
    iget-object v3, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->window:[B

    iget-object v4, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_out:[B

    invoke-static {v3, v2, v4, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 692
    add-int/2addr v1, v0

    .line 693
    add-int/2addr v2, v0

    .line 697
    :cond_7
    iput v1, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_out_index:I

    .line 698
    iput v2, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->read:I

    .line 701
    return p2

    .line 642
    .end local v0    # "n":I
    :cond_8
    iget v3, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->end:I

    goto :goto_0
.end method

.method proc(Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I
    .locals 31
    .param p1, "z"    # Lorg/jboss/netty/util/internal/jzlib/ZStream;
    .param p2, "r"    # I

    .prologue
    .line 128
    move-object/from16 v0, p1

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    move/from16 v27, v0

    .line 129
    .local v27, "p":I
    move-object/from16 v0, p1

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    move/from16 v26, v0

    .line 130
    .local v26, "n":I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    move/from16 v19, v0

    .line 131
    .local v19, "b":I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    move/from16 v24, v0

    .line 134
    .local v24, "k":I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    move/from16 v29, v0

    .line 135
    .local v29, "q":I
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->read:I

    move/from16 v0, v29

    if-ge v0, v4, :cond_1

    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->read:I

    sub-int v4, v4, v29

    add-int/lit8 v25, v4, -0x1

    .line 140
    .local v25, "m":I
    :cond_0
    :goto_0
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->mode:I

    packed-switch v4, :pswitch_data_0

    .line 600
    const/16 p2, -0x2

    .line 602
    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    .line 603
    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    .line 604
    move/from16 v0, v26

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 605
    move-object/from16 v0, p1

    iget-wide v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    move-object/from16 v0, p1

    iget v6, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    sub-int v6, v27, v6

    int-to-long v6, v6

    add-long/2addr v4, v6

    move-object/from16 v0, p1

    iput-wide v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    .line 606
    move/from16 v0, v27

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 607
    move/from16 v0, v29

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 608
    invoke-virtual/range {p0 .. p2}, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inflate_flush(Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I

    move-result v4

    :goto_1
    return v4

    .line 135
    .end local v25    # "m":I
    :cond_1
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->end:I

    sub-int v25, v4, v29

    goto :goto_0

    .line 143
    .end local v27    # "p":I
    .restart local v25    # "m":I
    .local v28, "p":I
    :goto_2
    const/4 v4, 0x3

    move/from16 v0, v24

    if-ge v0, v4, :cond_3

    .line 144
    if-eqz v26, :cond_2

    .line 145
    const/16 p2, 0x0

    .line 155
    add-int/lit8 v26, v26, -0x1

    .line 156
    move-object/from16 v0, p1

    iget-object v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in:[B

    add-int/lit8 v27, v28, 0x1

    .end local v28    # "p":I
    .restart local v27    # "p":I
    aget-byte v4, v4, v28

    and-int/lit16 v4, v4, 0xff

    shl-int v4, v4, v24

    or-int v19, v19, v4

    .line 157
    add-int/lit8 v24, v24, 0x8

    move/from16 v28, v27

    .end local v27    # "p":I
    .restart local v28    # "p":I
    goto :goto_2

    .line 147
    :cond_2
    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    .line 148
    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    .line 149
    move/from16 v0, v26

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 150
    move-object/from16 v0, p1

    iget-wide v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    move-object/from16 v0, p1

    iget v6, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    sub-int v6, v28, v6

    int-to-long v6, v6

    add-long/2addr v4, v6

    move-object/from16 v0, p1

    iput-wide v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    .line 151
    move/from16 v0, v28

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 152
    move/from16 v0, v29

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 153
    invoke-virtual/range {p0 .. p2}, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inflate_flush(Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I

    move-result v4

    move/from16 v27, v28

    .end local v28    # "p":I
    .restart local v27    # "p":I
    goto :goto_1

    .line 159
    .end local v27    # "p":I
    .restart local v28    # "p":I
    :cond_3
    and-int/lit8 v30, v19, 0x7

    .line 160
    .local v30, "t":I
    and-int/lit8 v4, v30, 0x1

    move-object/from16 v0, p0

    iput v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->last:I

    .line 162
    ushr-int/lit8 v4, v30, 0x1

    packed-switch v4, :pswitch_data_1

    :goto_3
    move/from16 v27, v28

    .line 221
    .end local v28    # "p":I
    .restart local v27    # "p":I
    goto/16 :goto_0

    .line 165
    .end local v27    # "p":I
    .restart local v28    # "p":I
    :pswitch_0
    ushr-int/lit8 v19, v19, 0x3

    .line 166
    add-int/lit8 v24, v24, -0x3

    .line 168
    and-int/lit8 v30, v24, 0x7

    .line 171
    ushr-int v19, v19, v30

    .line 172
    sub-int v24, v24, v30

    .line 174
    const/4 v4, 0x1

    move-object/from16 v0, p0

    iput v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->mode:I

    goto :goto_3

    .line 178
    :pswitch_1
    const/4 v4, 0x1

    new-array v8, v4, [I

    .line 179
    .local v8, "bl":[I
    const/4 v4, 0x1

    new-array v9, v4, [I

    .line 180
    .local v9, "bd":[I
    const/4 v4, 0x1

    new-array v10, v4, [[I

    .line 181
    .local v10, "tl":[[I
    const/4 v4, 0x1

    new-array v11, v4, [[I

    .line 183
    .local v11, "td":[[I
    invoke-static {v8, v9, v10, v11}, Lorg/jboss/netty/util/internal/jzlib/InfTree;->inflate_trees_fixed([I[I[[I[[I)I

    .line 184
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->codes:Lorg/jboss/netty/util/internal/jzlib/InfCodes;

    const/4 v5, 0x0

    aget v5, v8, v5

    const/4 v6, 0x0

    aget v6, v9, v6

    const/4 v7, 0x0

    aget-object v7, v10, v7

    const/4 v8, 0x0

    const/4 v12, 0x0

    aget-object v9, v11, v12

    .end local v8    # "bl":[I
    .end local v9    # "bd":[I
    const/4 v10, 0x0

    invoke-virtual/range {v4 .. v10}, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->init(II[II[II)V

    .line 188
    .end local v10    # "tl":[[I
    ushr-int/lit8 v19, v19, 0x3

    .line 189
    add-int/lit8 v24, v24, -0x3

    .line 192
    const/4 v4, 0x6

    move-object/from16 v0, p0

    iput v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->mode:I

    goto :goto_3

    .line 197
    .end local v11    # "td":[[I
    :pswitch_2
    ushr-int/lit8 v19, v19, 0x3

    .line 198
    add-int/lit8 v24, v24, -0x3

    .line 201
    const/4 v4, 0x3

    move-object/from16 v0, p0

    iput v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->mode:I

    goto :goto_3

    .line 206
    :pswitch_3
    ushr-int/lit8 v19, v19, 0x3

    .line 207
    add-int/lit8 v24, v24, -0x3

    .line 209
    const/16 v4, 0x9

    move-object/from16 v0, p0

    iput v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->mode:I

    .line 210
    const-string v4, "invalid block type"

    move-object/from16 v0, p1

    iput-object v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->msg:Ljava/lang/String;

    .line 211
    const/16 p2, -0x3

    .line 213
    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    .line 214
    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    .line 215
    move/from16 v0, v26

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 216
    move-object/from16 v0, p1

    iget-wide v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    move-object/from16 v0, p1

    iget v6, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    sub-int v6, v28, v6

    int-to-long v6, v6

    add-long/2addr v4, v6

    move-object/from16 v0, p1

    iput-wide v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    .line 217
    move/from16 v0, v28

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 218
    move/from16 v0, v29

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 219
    invoke-virtual/range {p0 .. p2}, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inflate_flush(Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I

    move-result v4

    move/from16 v27, v28

    .end local v28    # "p":I
    .restart local v27    # "p":I
    goto/16 :goto_1

    .line 224
    .end local v27    # "p":I
    .end local v30    # "t":I
    .restart local v28    # "p":I
    :goto_4
    const/16 v4, 0x20

    move/from16 v0, v24

    if-ge v0, v4, :cond_5

    .line 225
    if-eqz v26, :cond_4

    .line 226
    const/16 p2, 0x0

    .line 236
    add-int/lit8 v26, v26, -0x1

    .line 237
    move-object/from16 v0, p1

    iget-object v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in:[B

    add-int/lit8 v27, v28, 0x1

    .end local v28    # "p":I
    .restart local v27    # "p":I
    aget-byte v4, v4, v28

    and-int/lit16 v4, v4, 0xff

    shl-int v4, v4, v24

    or-int v19, v19, v4

    .line 238
    add-int/lit8 v24, v24, 0x8

    move/from16 v28, v27

    .end local v27    # "p":I
    .restart local v28    # "p":I
    goto :goto_4

    .line 228
    :cond_4
    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    .line 229
    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    .line 230
    move/from16 v0, v26

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 231
    move-object/from16 v0, p1

    iget-wide v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    move-object/from16 v0, p1

    iget v6, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    sub-int v6, v28, v6

    int-to-long v6, v6

    add-long/2addr v4, v6

    move-object/from16 v0, p1

    iput-wide v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    .line 232
    move/from16 v0, v28

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 233
    move/from16 v0, v29

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 234
    invoke-virtual/range {p0 .. p2}, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inflate_flush(Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I

    move-result v4

    move/from16 v27, v28

    .end local v28    # "p":I
    .restart local v27    # "p":I
    goto/16 :goto_1

    .line 241
    .end local v27    # "p":I
    .restart local v28    # "p":I
    :cond_5
    xor-int/lit8 v4, v19, -0x1

    ushr-int/lit8 v4, v4, 0x10

    const v5, 0xffff

    and-int/2addr v4, v5

    const v5, 0xffff

    and-int v5, v5, v19

    if-eq v4, v5, :cond_6

    .line 242
    const/16 v4, 0x9

    move-object/from16 v0, p0

    iput v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->mode:I

    .line 243
    const-string v4, "invalid stored block lengths"

    move-object/from16 v0, p1

    iput-object v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->msg:Ljava/lang/String;

    .line 244
    const/16 p2, -0x3

    .line 246
    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    .line 247
    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    .line 248
    move/from16 v0, v26

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 249
    move-object/from16 v0, p1

    iget-wide v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    move-object/from16 v0, p1

    iget v6, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    sub-int v6, v28, v6

    int-to-long v6, v6

    add-long/2addr v4, v6

    move-object/from16 v0, p1

    iput-wide v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    .line 250
    move/from16 v0, v28

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 251
    move/from16 v0, v29

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 252
    invoke-virtual/range {p0 .. p2}, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inflate_flush(Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I

    move-result v4

    move/from16 v27, v28

    .end local v28    # "p":I
    .restart local v27    # "p":I
    goto/16 :goto_1

    .line 254
    .end local v27    # "p":I
    .restart local v28    # "p":I
    :cond_6
    const v4, 0xffff

    and-int v4, v4, v19

    move-object/from16 v0, p0

    iput v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->left:I

    .line 255
    const/16 v24, 0x0

    move/from16 v19, v24

    .line 256
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->left:I

    if-eqz v4, :cond_7

    const/4 v4, 0x2

    :goto_5
    move-object/from16 v0, p0

    iput v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->mode:I

    move/from16 v27, v28

    .line 257
    .end local v28    # "p":I
    .restart local v27    # "p":I
    goto/16 :goto_0

    .line 256
    .end local v27    # "p":I
    .restart local v28    # "p":I
    :cond_7
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->last:I

    if-eqz v4, :cond_8

    const/4 v4, 0x7

    goto :goto_5

    :cond_8
    const/4 v4, 0x0

    goto :goto_5

    .line 259
    .end local v28    # "p":I
    .restart local v27    # "p":I
    :pswitch_4
    if-nez v26, :cond_9

    .line 260
    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    .line 261
    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    .line 262
    const/4 v4, 0x0

    move-object/from16 v0, p1

    iput v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 263
    move-object/from16 v0, p1

    iget-wide v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    move-object/from16 v0, p1

    iget v6, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    sub-int v6, v27, v6

    int-to-long v6, v6

    add-long/2addr v4, v6

    move-object/from16 v0, p1

    iput-wide v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    .line 264
    move/from16 v0, v27

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 265
    move/from16 v0, v29

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 266
    invoke-virtual/range {p0 .. p2}, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inflate_flush(Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I

    move-result v4

    goto/16 :goto_1

    .line 269
    :cond_9
    if-nez v25, :cond_f

    .line 270
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->end:I

    move/from16 v0, v29

    if-ne v0, v4, :cond_a

    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->read:I

    if-eqz v4, :cond_a

    .line 271
    const/16 v29, 0x0

    .line 272
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->read:I

    move/from16 v0, v29

    if-ge v0, v4, :cond_c

    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->read:I

    sub-int v4, v4, v29

    add-int/lit8 v25, v4, -0x1

    .line 274
    :cond_a
    :goto_6
    if-nez v25, :cond_f

    .line 275
    move/from16 v0, v29

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 276
    invoke-virtual/range {p0 .. p2}, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inflate_flush(Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I

    move-result p2

    .line 277
    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    move/from16 v29, v0

    .line 278
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->read:I

    move/from16 v0, v29

    if-ge v0, v4, :cond_d

    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->read:I

    sub-int v4, v4, v29

    add-int/lit8 v25, v4, -0x1

    .line 279
    :goto_7
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->end:I

    move/from16 v0, v29

    if-ne v0, v4, :cond_b

    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->read:I

    if-eqz v4, :cond_b

    .line 280
    const/16 v29, 0x0

    .line 281
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->read:I

    move/from16 v0, v29

    if-ge v0, v4, :cond_e

    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->read:I

    sub-int v4, v4, v29

    add-int/lit8 v25, v4, -0x1

    .line 283
    :cond_b
    :goto_8
    if-nez v25, :cond_f

    .line 284
    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    .line 285
    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    .line 286
    move/from16 v0, v26

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 287
    move-object/from16 v0, p1

    iget-wide v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    move-object/from16 v0, p1

    iget v6, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    sub-int v6, v27, v6

    int-to-long v6, v6

    add-long/2addr v4, v6

    move-object/from16 v0, p1

    iput-wide v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    .line 288
    move/from16 v0, v27

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 289
    move/from16 v0, v29

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 290
    invoke-virtual/range {p0 .. p2}, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inflate_flush(Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I

    move-result v4

    goto/16 :goto_1

    .line 272
    :cond_c
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->end:I

    sub-int v25, v4, v29

    goto :goto_6

    .line 278
    :cond_d
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->end:I

    sub-int v25, v4, v29

    goto :goto_7

    .line 281
    :cond_e
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->end:I

    sub-int v25, v4, v29

    goto :goto_8

    .line 294
    :cond_f
    const/16 p2, 0x0

    .line 296
    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->left:I

    move/from16 v30, v0

    .line 297
    .restart local v30    # "t":I
    move/from16 v0, v30

    move/from16 v1, v26

    if-le v0, v1, :cond_10

    .line 298
    move/from16 v30, v26

    .line 300
    :cond_10
    move/from16 v0, v30

    move/from16 v1, v25

    if-le v0, v1, :cond_11

    .line 301
    move/from16 v30, v25

    .line 303
    :cond_11
    move-object/from16 v0, p1

    iget-object v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in:[B

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->window:[B

    move/from16 v0, v27

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-static {v4, v0, v5, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 304
    add-int v27, v27, v30

    .line 305
    sub-int v26, v26, v30

    .line 306
    add-int v29, v29, v30

    .line 307
    sub-int v25, v25, v30

    .line 308
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->left:I

    sub-int v4, v4, v30

    move-object/from16 v0, p0

    iput v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->left:I

    if-nez v4, :cond_0

    .line 311
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->last:I

    if-eqz v4, :cond_12

    const/4 v4, 0x7

    :goto_9
    move-object/from16 v0, p0

    iput v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->mode:I

    goto/16 :goto_0

    :cond_12
    const/4 v4, 0x0

    goto :goto_9

    .line 315
    .end local v27    # "p":I
    .end local v30    # "t":I
    .restart local v28    # "p":I
    :goto_a
    const/16 v4, 0xe

    move/from16 v0, v24

    if-ge v0, v4, :cond_14

    .line 316
    if-eqz v26, :cond_13

    .line 317
    const/16 p2, 0x0

    .line 327
    add-int/lit8 v26, v26, -0x1

    .line 328
    move-object/from16 v0, p1

    iget-object v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in:[B

    add-int/lit8 v27, v28, 0x1

    .end local v28    # "p":I
    .restart local v27    # "p":I
    aget-byte v4, v4, v28

    and-int/lit16 v4, v4, 0xff

    shl-int v4, v4, v24

    or-int v19, v19, v4

    .line 329
    add-int/lit8 v24, v24, 0x8

    move/from16 v28, v27

    .end local v27    # "p":I
    .restart local v28    # "p":I
    goto :goto_a

    .line 319
    :cond_13
    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    .line 320
    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    .line 321
    move/from16 v0, v26

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 322
    move-object/from16 v0, p1

    iget-wide v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    move-object/from16 v0, p1

    iget v6, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    sub-int v6, v28, v6

    int-to-long v6, v6

    add-long/2addr v4, v6

    move-object/from16 v0, p1

    iput-wide v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    .line 323
    move/from16 v0, v28

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 324
    move/from16 v0, v29

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 325
    invoke-virtual/range {p0 .. p2}, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inflate_flush(Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I

    move-result v4

    move/from16 v27, v28

    .end local v28    # "p":I
    .restart local v27    # "p":I
    goto/16 :goto_1

    .line 332
    .end local v27    # "p":I
    .restart local v28    # "p":I
    :cond_14
    move/from16 v0, v19

    and-int/lit16 v0, v0, 0x3fff

    move/from16 v30, v0

    .restart local v30    # "t":I
    move/from16 v0, v30

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->table:I

    .line 333
    and-int/lit8 v4, v30, 0x1f

    const/16 v5, 0x1d

    if-gt v4, v5, :cond_15

    shr-int/lit8 v4, v30, 0x5

    and-int/lit8 v4, v4, 0x1f

    const/16 v5, 0x1d

    if-le v4, v5, :cond_16

    .line 334
    :cond_15
    const/16 v4, 0x9

    move-object/from16 v0, p0

    iput v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->mode:I

    .line 335
    const-string v4, "too many length or distance symbols"

    move-object/from16 v0, p1

    iput-object v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->msg:Ljava/lang/String;

    .line 336
    const/16 p2, -0x3

    .line 338
    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    .line 339
    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    .line 340
    move/from16 v0, v26

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 341
    move-object/from16 v0, p1

    iget-wide v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    move-object/from16 v0, p1

    iget v6, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    sub-int v6, v28, v6

    int-to-long v6, v6

    add-long/2addr v4, v6

    move-object/from16 v0, p1

    iput-wide v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    .line 342
    move/from16 v0, v28

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 343
    move/from16 v0, v29

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 344
    invoke-virtual/range {p0 .. p2}, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inflate_flush(Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I

    move-result v4

    move/from16 v27, v28

    .end local v28    # "p":I
    .restart local v27    # "p":I
    goto/16 :goto_1

    .line 346
    .end local v27    # "p":I
    .restart local v28    # "p":I
    :cond_16
    and-int/lit8 v4, v30, 0x1f

    add-int/lit16 v4, v4, 0x102

    shr-int/lit8 v5, v30, 0x5

    and-int/lit8 v5, v5, 0x1f

    add-int v30, v4, v5

    .line 347
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->blens:[I

    if-eqz v4, :cond_17

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->blens:[I

    array-length v4, v4

    move/from16 v0, v30

    if-ge v4, v0, :cond_19

    .line 348
    :cond_17
    move/from16 v0, v30

    new-array v4, v0, [I

    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->blens:[I

    .line 356
    :cond_18
    ushr-int/lit8 v19, v19, 0xe

    .line 357
    add-int/lit8 v24, v24, -0xe

    .line 360
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->index:I

    .line 361
    const/4 v4, 0x4

    move-object/from16 v0, p0

    iput v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->mode:I

    move/from16 v27, v28

    .line 363
    .end local v28    # "p":I
    .end local v30    # "t":I
    .restart local v27    # "p":I
    :goto_b
    :pswitch_5
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->index:I

    move-object/from16 v0, p0

    iget v5, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->table:I

    ushr-int/lit8 v5, v5, 0xa

    add-int/lit8 v5, v5, 0x4

    if-ge v4, v5, :cond_1c

    move/from16 v28, v27

    .line 364
    .end local v27    # "p":I
    .restart local v28    # "p":I
    :goto_c
    const/4 v4, 0x3

    move/from16 v0, v24

    if-ge v0, v4, :cond_1b

    .line 365
    if-eqz v26, :cond_1a

    .line 366
    const/16 p2, 0x0

    .line 376
    add-int/lit8 v26, v26, -0x1

    .line 377
    move-object/from16 v0, p1

    iget-object v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in:[B

    add-int/lit8 v27, v28, 0x1

    .end local v28    # "p":I
    .restart local v27    # "p":I
    aget-byte v4, v4, v28

    and-int/lit16 v4, v4, 0xff

    shl-int v4, v4, v24

    or-int v19, v19, v4

    .line 378
    add-int/lit8 v24, v24, 0x8

    move/from16 v28, v27

    .end local v27    # "p":I
    .restart local v28    # "p":I
    goto :goto_c

    .line 350
    .restart local v30    # "t":I
    :cond_19
    const/16 v21, 0x0

    .local v21, "i":I
    :goto_d
    move/from16 v0, v21

    move/from16 v1, v30

    if-ge v0, v1, :cond_18

    .line 351
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->blens:[I

    const/4 v5, 0x0

    aput v5, v4, v21

    .line 350
    add-int/lit8 v21, v21, 0x1

    goto :goto_d

    .line 368
    .end local v21    # "i":I
    .end local v30    # "t":I
    :cond_1a
    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    .line 369
    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    .line 370
    move/from16 v0, v26

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 371
    move-object/from16 v0, p1

    iget-wide v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    move-object/from16 v0, p1

    iget v6, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    sub-int v6, v28, v6

    int-to-long v6, v6

    add-long/2addr v4, v6

    move-object/from16 v0, p1

    iput-wide v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    .line 372
    move/from16 v0, v28

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 373
    move/from16 v0, v29

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 374
    invoke-virtual/range {p0 .. p2}, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inflate_flush(Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I

    move-result v4

    move/from16 v27, v28

    .end local v28    # "p":I
    .restart local v27    # "p":I
    goto/16 :goto_1

    .line 381
    .end local v27    # "p":I
    .restart local v28    # "p":I
    :cond_1b
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->blens:[I

    sget-object v5, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->border:[I

    move-object/from16 v0, p0

    iget v6, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->index:I

    add-int/lit8 v7, v6, 0x1

    move-object/from16 v0, p0

    iput v7, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->index:I

    aget v5, v5, v6

    and-int/lit8 v6, v19, 0x7

    aput v6, v4, v5

    .line 384
    ushr-int/lit8 v19, v19, 0x3

    .line 385
    add-int/lit8 v24, v24, -0x3

    move/from16 v27, v28

    .end local v28    # "p":I
    .restart local v27    # "p":I
    goto/16 :goto_b

    .line 389
    :cond_1c
    :goto_e
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->index:I

    const/16 v5, 0x13

    if-ge v4, v5, :cond_1d

    .line 390
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->blens:[I

    sget-object v5, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->border:[I

    move-object/from16 v0, p0

    iget v6, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->index:I

    add-int/lit8 v7, v6, 0x1

    move-object/from16 v0, p0

    iput v7, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->index:I

    aget v5, v5, v6

    const/4 v6, 0x0

    aput v6, v4, v5

    goto :goto_e

    .line 393
    :cond_1d
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bb:[I

    const/4 v5, 0x0

    const/4 v6, 0x7

    aput v6, v4, v5

    .line 394
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inftree:Lorg/jboss/netty/util/internal/jzlib/InfTree;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->blens:[I

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bb:[I

    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->tb:[I

    move-object/from16 v0, p0

    iget-object v8, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->hufts:[I

    move-object/from16 v9, p1

    invoke-virtual/range {v4 .. v9}, Lorg/jboss/netty/util/internal/jzlib/InfTree;->inflate_trees_bits([I[I[I[ILorg/jboss/netty/util/internal/jzlib/ZStream;)I

    move-result v30

    .line 395
    .restart local v30    # "t":I
    if-eqz v30, :cond_1f

    .line 396
    move/from16 p2, v30

    .line 397
    const/4 v4, -0x3

    move/from16 v0, p2

    if-ne v0, v4, :cond_1e

    .line 398
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->blens:[I

    .line 399
    const/16 v4, 0x9

    move-object/from16 v0, p0

    iput v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->mode:I

    .line 402
    :cond_1e
    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    .line 403
    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    .line 404
    move/from16 v0, v26

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 405
    move-object/from16 v0, p1

    iget-wide v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    move-object/from16 v0, p1

    iget v6, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    sub-int v6, v27, v6

    int-to-long v6, v6

    add-long/2addr v4, v6

    move-object/from16 v0, p1

    iput-wide v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    .line 406
    move/from16 v0, v27

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 407
    move/from16 v0, v29

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 408
    invoke-virtual/range {p0 .. p2}, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inflate_flush(Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I

    move-result v4

    goto/16 :goto_1

    .line 411
    :cond_1f
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->index:I

    .line 412
    const/4 v4, 0x5

    move-object/from16 v0, p0

    iput v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->mode:I

    .line 415
    .end local v30    # "t":I
    :goto_f
    :pswitch_6
    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->table:I

    move/from16 v30, v0

    .line 416
    .restart local v30    # "t":I
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->index:I

    and-int/lit8 v5, v30, 0x1f

    add-int/lit16 v5, v5, 0x102

    shr-int/lit8 v6, v30, 0x5

    and-int/lit8 v6, v6, 0x1f

    add-int/2addr v5, v6

    if-lt v4, v5, :cond_21

    .line 507
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->tb:[I

    const/4 v5, 0x0

    const/4 v6, -0x1

    aput v6, v4, v5

    .line 509
    const/4 v4, 0x1

    new-array v8, v4, [I

    .line 510
    .restart local v8    # "bl":[I
    const/4 v4, 0x1

    new-array v9, v4, [I

    .line 511
    .restart local v9    # "bd":[I
    const/4 v4, 0x1

    new-array v10, v4, [I

    .line 512
    .local v10, "tl":[I
    const/4 v4, 0x1

    new-array v11, v4, [I

    .line 513
    .local v11, "td":[I
    const/4 v4, 0x0

    const/16 v5, 0x9

    aput v5, v8, v4

    .line 514
    const/4 v4, 0x0

    const/4 v5, 0x6

    aput v5, v9, v4

    .line 516
    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->table:I

    move/from16 v30, v0

    .line 517
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inftree:Lorg/jboss/netty/util/internal/jzlib/InfTree;

    and-int/lit8 v5, v30, 0x1f

    add-int/lit16 v5, v5, 0x101

    shr-int/lit8 v6, v30, 0x5

    and-int/lit8 v6, v6, 0x1f

    add-int/lit8 v6, v6, 0x1

    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->blens:[I

    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->hufts:[I

    move-object/from16 v13, p1

    invoke-virtual/range {v4 .. v13}, Lorg/jboss/netty/util/internal/jzlib/InfTree;->inflate_trees_dynamic(II[I[I[I[I[I[ILorg/jboss/netty/util/internal/jzlib/ZStream;)I

    move-result v30

    .line 521
    if-eqz v30, :cond_2d

    .line 522
    const/4 v4, -0x3

    move/from16 v0, v30

    if-ne v0, v4, :cond_20

    .line 523
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->blens:[I

    .line 524
    const/16 v4, 0x9

    move-object/from16 v0, p0

    iput v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->mode:I

    .line 526
    :cond_20
    move/from16 p2, v30

    .line 528
    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    .line 529
    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    .line 530
    move/from16 v0, v26

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 531
    move-object/from16 v0, p1

    iget-wide v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    move-object/from16 v0, p1

    iget v6, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    sub-int v6, v27, v6

    int-to-long v6, v6

    add-long/2addr v4, v6

    move-object/from16 v0, p1

    iput-wide v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    .line 532
    move/from16 v0, v27

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 533
    move/from16 v0, v29

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 534
    invoke-virtual/range {p0 .. p2}, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inflate_flush(Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I

    move-result v4

    goto/16 :goto_1

    .line 422
    .end local v8    # "bl":[I
    .end local v9    # "bd":[I
    .end local v10    # "tl":[I
    .end local v11    # "td":[I
    :cond_21
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bb:[I

    const/4 v5, 0x0

    aget v30, v4, v5

    move/from16 v28, v27

    .line 424
    .end local v27    # "p":I
    .restart local v28    # "p":I
    :goto_10
    move/from16 v0, v24

    move/from16 v1, v30

    if-ge v0, v1, :cond_23

    .line 425
    if-eqz v26, :cond_22

    .line 426
    const/16 p2, 0x0

    .line 436
    add-int/lit8 v26, v26, -0x1

    .line 437
    move-object/from16 v0, p1

    iget-object v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in:[B

    add-int/lit8 v27, v28, 0x1

    .end local v28    # "p":I
    .restart local v27    # "p":I
    aget-byte v4, v4, v28

    and-int/lit16 v4, v4, 0xff

    shl-int v4, v4, v24

    or-int v19, v19, v4

    .line 438
    add-int/lit8 v24, v24, 0x8

    move/from16 v28, v27

    .end local v27    # "p":I
    .restart local v28    # "p":I
    goto :goto_10

    .line 428
    :cond_22
    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    .line 429
    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    .line 430
    move/from16 v0, v26

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 431
    move-object/from16 v0, p1

    iget-wide v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    move-object/from16 v0, p1

    iget v6, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    sub-int v6, v28, v6

    int-to-long v6, v6

    add-long/2addr v4, v6

    move-object/from16 v0, p1

    iput-wide v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    .line 432
    move/from16 v0, v28

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 433
    move/from16 v0, v29

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 434
    invoke-virtual/range {p0 .. p2}, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inflate_flush(Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I

    move-result v4

    move/from16 v27, v28

    .end local v28    # "p":I
    .restart local v27    # "p":I
    goto/16 :goto_1

    .line 441
    .end local v27    # "p":I
    .restart local v28    # "p":I
    :cond_23
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->tb:[I

    const/4 v5, 0x0

    aget v4, v4, v5

    const/4 v5, -0x1

    if-ne v4, v5, :cond_24

    .line 445
    :cond_24
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->hufts:[I

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->tb:[I

    const/4 v6, 0x0

    aget v5, v5, v6

    sget-object v6, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inflate_mask:[I

    aget v6, v6, v30

    and-int v6, v6, v19

    add-int/2addr v5, v6

    mul-int/lit8 v5, v5, 0x3

    add-int/lit8 v5, v5, 0x1

    aget v30, v4, v5

    .line 446
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->hufts:[I

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->tb:[I

    const/4 v6, 0x0

    aget v5, v5, v6

    sget-object v6, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inflate_mask:[I

    aget v6, v6, v30

    and-int v6, v6, v19

    add-int/2addr v5, v6

    mul-int/lit8 v5, v5, 0x3

    add-int/lit8 v5, v5, 0x2

    aget v20, v4, v5

    .line 448
    .local v20, "c":I
    const/16 v4, 0x10

    move/from16 v0, v20

    if-ge v0, v4, :cond_25

    .line 449
    ushr-int v19, v19, v30

    .line 450
    sub-int v24, v24, v30

    .line 451
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->blens:[I

    move-object/from16 v0, p0

    iget v5, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->index:I

    add-int/lit8 v6, v5, 0x1

    move-object/from16 v0, p0

    iput v6, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->index:I

    aput v20, v4, v5

    move/from16 v27, v28

    .end local v28    # "p":I
    .restart local v27    # "p":I
    goto/16 :goto_f

    .line 453
    .end local v27    # "p":I
    .restart local v28    # "p":I
    :cond_25
    const/16 v4, 0x12

    move/from16 v0, v20

    if-ne v0, v4, :cond_26

    const/16 v21, 0x7

    .line 454
    .restart local v21    # "i":I
    :goto_11
    const/16 v4, 0x12

    move/from16 v0, v20

    if-ne v0, v4, :cond_27

    const/16 v23, 0xb

    .line 456
    .local v23, "j":I
    :goto_12
    add-int v4, v30, v21

    move/from16 v0, v24

    if-ge v0, v4, :cond_29

    .line 457
    if-eqz v26, :cond_28

    .line 458
    const/16 p2, 0x0

    .line 468
    add-int/lit8 v26, v26, -0x1

    .line 469
    move-object/from16 v0, p1

    iget-object v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in:[B

    add-int/lit8 v27, v28, 0x1

    .end local v28    # "p":I
    .restart local v27    # "p":I
    aget-byte v4, v4, v28

    and-int/lit16 v4, v4, 0xff

    shl-int v4, v4, v24

    or-int v19, v19, v4

    .line 470
    add-int/lit8 v24, v24, 0x8

    move/from16 v28, v27

    .end local v27    # "p":I
    .restart local v28    # "p":I
    goto :goto_12

    .line 453
    .end local v21    # "i":I
    .end local v23    # "j":I
    :cond_26
    add-int/lit8 v21, v20, -0xe

    goto :goto_11

    .line 454
    .restart local v21    # "i":I
    :cond_27
    const/16 v23, 0x3

    goto :goto_12

    .line 460
    .restart local v23    # "j":I
    :cond_28
    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    .line 461
    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    .line 462
    move/from16 v0, v26

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 463
    move-object/from16 v0, p1

    iget-wide v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    move-object/from16 v0, p1

    iget v6, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    sub-int v6, v28, v6

    int-to-long v6, v6

    add-long/2addr v4, v6

    move-object/from16 v0, p1

    iput-wide v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    .line 464
    move/from16 v0, v28

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 465
    move/from16 v0, v29

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 466
    invoke-virtual/range {p0 .. p2}, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inflate_flush(Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I

    move-result v4

    move/from16 v27, v28

    .end local v28    # "p":I
    .restart local v27    # "p":I
    goto/16 :goto_1

    .line 473
    .end local v27    # "p":I
    .restart local v28    # "p":I
    :cond_29
    ushr-int v19, v19, v30

    .line 474
    sub-int v24, v24, v30

    .line 476
    sget-object v4, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inflate_mask:[I

    aget v4, v4, v21

    and-int v4, v4, v19

    add-int v23, v23, v4

    .line 478
    ushr-int v19, v19, v21

    .line 479
    sub-int v24, v24, v21

    .line 481
    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->index:I

    move/from16 v21, v0

    .line 482
    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->table:I

    move/from16 v30, v0

    .line 483
    add-int v4, v21, v23

    and-int/lit8 v5, v30, 0x1f

    add-int/lit16 v5, v5, 0x102

    shr-int/lit8 v6, v30, 0x5

    and-int/lit8 v6, v6, 0x1f

    add-int/2addr v5, v6

    if-gt v4, v5, :cond_2a

    const/16 v4, 0x10

    move/from16 v0, v20

    if-ne v0, v4, :cond_2b

    const/4 v4, 0x1

    move/from16 v0, v21

    if-ge v0, v4, :cond_2b

    .line 485
    :cond_2a
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->blens:[I

    .line 486
    const/16 v4, 0x9

    move-object/from16 v0, p0

    iput v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->mode:I

    .line 487
    const-string v4, "invalid bit length repeat"

    move-object/from16 v0, p1

    iput-object v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->msg:Ljava/lang/String;

    .line 488
    const/16 p2, -0x3

    .line 490
    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    .line 491
    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    .line 492
    move/from16 v0, v26

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 493
    move-object/from16 v0, p1

    iget-wide v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    move-object/from16 v0, p1

    iget v6, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    sub-int v6, v28, v6

    int-to-long v6, v6

    add-long/2addr v4, v6

    move-object/from16 v0, p1

    iput-wide v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    .line 494
    move/from16 v0, v28

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 495
    move/from16 v0, v29

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 496
    invoke-virtual/range {p0 .. p2}, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inflate_flush(Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I

    move-result v4

    move/from16 v27, v28

    .end local v28    # "p":I
    .restart local v27    # "p":I
    goto/16 :goto_1

    .line 499
    .end local v27    # "p":I
    .restart local v28    # "p":I
    :cond_2b
    const/16 v4, 0x10

    move/from16 v0, v20

    if-ne v0, v4, :cond_2c

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->blens:[I

    add-int/lit8 v5, v21, -0x1

    aget v20, v4, v5

    .line 501
    :goto_13
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->blens:[I

    add-int/lit8 v22, v21, 0x1

    .end local v21    # "i":I
    .local v22, "i":I
    aput v20, v4, v21

    .line 502
    add-int/lit8 v23, v23, -0x1

    if-nez v23, :cond_32

    .line 503
    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->index:I

    move/from16 v27, v28

    .end local v28    # "p":I
    .restart local v27    # "p":I
    goto/16 :goto_f

    .line 499
    .end local v22    # "i":I
    .end local v27    # "p":I
    .restart local v21    # "i":I
    .restart local v28    # "p":I
    :cond_2c
    const/16 v20, 0x0

    goto :goto_13

    .line 536
    .end local v20    # "c":I
    .end local v21    # "i":I
    .end local v23    # "j":I
    .end local v28    # "p":I
    .restart local v8    # "bl":[I
    .restart local v9    # "bd":[I
    .restart local v10    # "tl":[I
    .restart local v11    # "td":[I
    .restart local v27    # "p":I
    :cond_2d
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->codes:Lorg/jboss/netty/util/internal/jzlib/InfCodes;

    const/4 v4, 0x0

    aget v13, v8, v4

    const/4 v4, 0x0

    aget v14, v9, v4

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->hufts:[I

    const/4 v4, 0x0

    aget v16, v10, v4

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->hufts:[I

    move-object/from16 v17, v0

    const/4 v4, 0x0

    aget v18, v11, v4

    invoke-virtual/range {v12 .. v18}, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->init(II[II[II)V

    .line 538
    const/4 v4, 0x6

    move-object/from16 v0, p0

    iput v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->mode:I

    .line 540
    .end local v8    # "bl":[I
    .end local v9    # "bd":[I
    .end local v10    # "tl":[I
    .end local v11    # "td":[I
    .end local v30    # "t":I
    :pswitch_7
    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    .line 541
    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    .line 542
    move/from16 v0, v26

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 543
    move-object/from16 v0, p1

    iget-wide v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    move-object/from16 v0, p1

    iget v6, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    sub-int v6, v27, v6

    int-to-long v6, v6

    add-long/2addr v4, v6

    move-object/from16 v0, p1

    iput-wide v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    .line 544
    move/from16 v0, v27

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 545
    move/from16 v0, v29

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 547
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->codes:Lorg/jboss/netty/util/internal/jzlib/InfCodes;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    invoke-virtual {v4, v0, v1, v2}, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->proc(Lorg/jboss/netty/util/internal/jzlib/InfBlocks;Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I

    move-result p2

    const/4 v4, 0x1

    move/from16 v0, p2

    if-eq v0, v4, :cond_2e

    .line 548
    invoke-virtual/range {p0 .. p2}, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inflate_flush(Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I

    move-result v4

    goto/16 :goto_1

    .line 550
    :cond_2e
    const/16 p2, 0x0

    .line 552
    move-object/from16 v0, p1

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    move/from16 v27, v0

    .line 553
    move-object/from16 v0, p1

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    move/from16 v26, v0

    .line 554
    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    move/from16 v19, v0

    .line 555
    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    move/from16 v24, v0

    .line 556
    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    move/from16 v29, v0

    .line 557
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->read:I

    move/from16 v0, v29

    if-ge v0, v4, :cond_2f

    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->read:I

    sub-int v4, v4, v29

    add-int/lit8 v25, v4, -0x1

    .line 559
    :goto_14
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->last:I

    if-nez v4, :cond_30

    .line 560
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->mode:I

    goto/16 :goto_0

    .line 557
    :cond_2f
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->end:I

    sub-int v25, v4, v29

    goto :goto_14

    .line 563
    :cond_30
    const/4 v4, 0x7

    move-object/from16 v0, p0

    iput v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->mode:I

    .line 565
    :pswitch_8
    move/from16 v0, v29

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 566
    invoke-virtual/range {p0 .. p2}, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inflate_flush(Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I

    move-result p2

    .line 567
    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    move/from16 v29, v0

    .line 568
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->read:I

    move-object/from16 v0, p0

    iget v5, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    if-eq v4, v5, :cond_31

    .line 569
    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    .line 570
    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    .line 571
    move/from16 v0, v26

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 572
    move-object/from16 v0, p1

    iget-wide v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    move-object/from16 v0, p1

    iget v6, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    sub-int v6, v27, v6

    int-to-long v6, v6

    add-long/2addr v4, v6

    move-object/from16 v0, p1

    iput-wide v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    .line 573
    move/from16 v0, v27

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 574
    move/from16 v0, v29

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 575
    invoke-virtual/range {p0 .. p2}, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inflate_flush(Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I

    move-result v4

    goto/16 :goto_1

    .line 577
    :cond_31
    const/16 v4, 0x8

    move-object/from16 v0, p0

    iput v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->mode:I

    .line 579
    :pswitch_9
    const/16 p2, 0x1

    .line 581
    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    .line 582
    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    .line 583
    move/from16 v0, v26

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 584
    move-object/from16 v0, p1

    iget-wide v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    move-object/from16 v0, p1

    iget v6, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    sub-int v6, v27, v6

    int-to-long v6, v6

    add-long/2addr v4, v6

    move-object/from16 v0, p1

    iput-wide v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    .line 585
    move/from16 v0, v27

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 586
    move/from16 v0, v29

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 587
    invoke-virtual/range {p0 .. p2}, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inflate_flush(Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I

    move-result v4

    goto/16 :goto_1

    .line 589
    :pswitch_a
    const/16 p2, -0x3

    .line 591
    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    .line 592
    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    .line 593
    move/from16 v0, v26

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 594
    move-object/from16 v0, p1

    iget-wide v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    move-object/from16 v0, p1

    iget v6, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    sub-int v6, v27, v6

    int-to-long v6, v6

    add-long/2addr v4, v6

    move-object/from16 v0, p1

    iput-wide v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    .line 595
    move/from16 v0, v27

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 596
    move/from16 v0, v29

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 597
    invoke-virtual/range {p0 .. p2}, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inflate_flush(Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I

    move-result v4

    goto/16 :goto_1

    .end local v27    # "p":I
    .restart local v20    # "c":I
    .restart local v22    # "i":I
    .restart local v23    # "j":I
    .restart local v28    # "p":I
    .restart local v30    # "t":I
    :cond_32
    move/from16 v21, v22

    .end local v22    # "i":I
    .restart local v21    # "i":I
    goto/16 :goto_13

    .end local v20    # "c":I
    .end local v21    # "i":I
    .end local v23    # "j":I
    .end local v28    # "p":I
    .end local v30    # "t":I
    .restart local v27    # "p":I
    :pswitch_b
    move/from16 v28, v27

    .end local v27    # "p":I
    .restart local v28    # "p":I
    goto/16 :goto_a

    .end local v28    # "p":I
    .restart local v27    # "p":I
    :pswitch_c
    move/from16 v28, v27

    .end local v27    # "p":I
    .restart local v28    # "p":I
    goto/16 :goto_4

    .end local v28    # "p":I
    .restart local v27    # "p":I
    :pswitch_d
    move/from16 v28, v27

    .end local v27    # "p":I
    .restart local v28    # "p":I
    goto/16 :goto_2

    .line 140
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_d
        :pswitch_c
        :pswitch_4
        :pswitch_b
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
    .end packed-switch

    .line 162
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method reset(Lorg/jboss/netty/util/internal/jzlib/ZStream;[J)V
    .locals 4
    .param p1, "z"    # Lorg/jboss/netty/util/internal/jzlib/ZStream;
    .param p2, "c"    # [J

    .prologue
    const/4 v3, 0x0

    .line 104
    if-eqz p2, :cond_0

    .line 105
    iget-wide v0, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->check:J

    aput-wide v0, p2, v3

    .line 107
    :cond_0
    iput v3, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->mode:I

    .line 108
    iput v3, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    .line 109
    iput v3, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    .line 110
    iput v3, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    iput v3, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->read:I

    .line 112
    iget-object v0, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->checkfn:Ljava/lang/Object;

    if-eqz v0, :cond_1

    .line 113
    const-wide/16 v0, 0x0

    const/4 v2, 0x0

    invoke-static {v0, v1, v2, v3, v3}, Lorg/jboss/netty/util/internal/jzlib/Adler32;->adler32(J[BII)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->check:J

    iput-wide v0, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->adler:J

    .line 115
    :cond_1
    return-void
.end method

.method set_dictionary([BII)V
    .locals 2
    .param p1, "d"    # [B
    .param p2, "start"    # I
    .param p3, "n"    # I

    .prologue
    .line 621
    iget-object v0, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->window:[B

    const/4 v1, 0x0

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 622
    iput p3, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    iput p3, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->read:I

    .line 623
    return-void
.end method

.method sync_point()I
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 628
    iget v1, p0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->mode:I

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
