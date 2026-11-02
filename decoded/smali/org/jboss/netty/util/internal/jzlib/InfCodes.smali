.class final Lorg/jboss/netty/util/internal/jzlib/InfCodes;
.super Ljava/lang/Object;
.source "InfCodes.java"


# static fields
.field private static final BADCODE:I = 0x9

.field private static final COPY:I = 0x5

.field private static final DIST:I = 0x3

.field private static final DISTEXT:I = 0x4

.field private static final END:I = 0x8

.field private static final LEN:I = 0x1

.field private static final LENEXT:I = 0x2

.field private static final LIT:I = 0x6

.field private static final START:I = 0x0

.field private static final WASH:I = 0x7

.field private static final inflate_mask:[I


# instance fields
.field private dbits:B

.field private dist:I

.field private dtree:[I

.field private dtree_index:I

.field private get:I

.field private lbits:B

.field private len:I

.field private lit:I

.field private ltree:[I

.field private ltree_index:I

.field private mode:I

.field private need:I

.field private tree:[I

.field private tree_index:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 52
    const/16 v0, 0x11

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->inflate_mask:[I

    return-void

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
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static inflate_fast(II[II[IILorg/jboss/netty/util/internal/jzlib/InfBlocks;Lorg/jboss/netty/util/internal/jzlib/ZStream;)I
    .locals 30
    .param p0, "bl"    # I
    .param p1, "bd"    # I
    .param p2, "tl"    # [I
    .param p3, "tl_index"    # I
    .param p4, "td"    # [I
    .param p5, "td_index"    # I
    .param p6, "s"    # Lorg/jboss/netty/util/internal/jzlib/InfBlocks;
    .param p7, "z"    # Lorg/jboss/netty/util/internal/jzlib/ZStream;

    .prologue
    .line 480
    move-object/from16 v0, p7

    iget v15, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 481
    .local v15, "p":I
    move-object/from16 v0, p7

    iget v14, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 482
    .local v14, "n":I
    move-object/from16 v0, p6

    iget v6, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    .line 483
    .local v6, "b":I
    move-object/from16 v0, p6

    iget v10, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    .line 484
    .local v10, "k":I
    move-object/from16 v0, p6

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    move/from16 v17, v0

    .line 485
    .local v17, "q":I
    move-object/from16 v0, p6

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->read:I

    move/from16 v25, v0

    move/from16 v0, v17

    move/from16 v1, v25

    if-ge v0, v1, :cond_0

    move-object/from16 v0, p6

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->read:I

    move/from16 v25, v0

    sub-int v25, v25, v17

    add-int/lit8 v11, v25, -0x1

    .line 488
    .local v11, "m":I
    :goto_0
    sget-object v25, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->inflate_mask:[I

    aget v13, v25, p0

    .line 489
    .local v13, "ml":I
    sget-object v25, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->inflate_mask:[I

    aget v12, v25, p1

    .local v12, "md":I
    move/from16 v18, v17

    .end local v17    # "q":I
    .local v18, "q":I
    move/from16 v16, v15

    .line 494
    .end local v15    # "p":I
    .local v16, "p":I
    :goto_1
    const/16 v25, 0x14

    move/from16 v0, v25

    if-ge v10, v0, :cond_1

    .line 495
    add-int/lit8 v14, v14, -0x1

    .line 496
    move-object/from16 v0, p7

    iget-object v0, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in:[B

    move-object/from16 v25, v0

    add-int/lit8 v15, v16, 0x1

    .end local v16    # "p":I
    .restart local v15    # "p":I
    aget-byte v25, v25, v16

    move/from16 v0, v25

    and-int/lit16 v0, v0, 0xff

    move/from16 v25, v0

    shl-int v25, v25, v10

    or-int v6, v6, v25

    .line 497
    add-int/lit8 v10, v10, 0x8

    move/from16 v16, v15

    .end local v15    # "p":I
    .restart local v16    # "p":I
    goto :goto_1

    .line 485
    .end local v11    # "m":I
    .end local v12    # "md":I
    .end local v13    # "ml":I
    .end local v16    # "p":I
    .end local v18    # "q":I
    .restart local v15    # "p":I
    .restart local v17    # "q":I
    :cond_0
    move-object/from16 v0, p6

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->end:I

    move/from16 v25, v0

    sub-int v11, v25, v17

    goto :goto_0

    .line 500
    .end local v15    # "p":I
    .end local v17    # "q":I
    .restart local v11    # "m":I
    .restart local v12    # "md":I
    .restart local v13    # "ml":I
    .restart local v16    # "p":I
    .restart local v18    # "q":I
    :cond_1
    and-int v21, v6, v13

    .line 501
    .local v21, "t":I
    move-object/from16 v22, p2

    .line 502
    .local v22, "tp":[I
    move/from16 v23, p3

    .line 503
    .local v23, "tp_index":I
    add-int v25, v23, v21

    mul-int/lit8 v24, v25, 0x3

    .line 504
    .local v24, "tp_index_t_3":I
    aget v9, v22, v24

    .local v9, "e":I
    if-nez v9, :cond_4

    .line 505
    add-int/lit8 v25, v24, 0x1

    aget v25, v22, v25

    shr-int v6, v6, v25

    .line 506
    add-int/lit8 v25, v24, 0x1

    aget v25, v22, v25

    sub-int v10, v10, v25

    .line 508
    move-object/from16 v0, p6

    iget-object v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->window:[B

    move-object/from16 v25, v0

    add-int/lit8 v17, v18, 0x1

    .end local v18    # "q":I
    .restart local v17    # "q":I
    add-int/lit8 v26, v24, 0x2

    aget v26, v22, v26

    move/from16 v0, v26

    int-to-byte v0, v0

    move/from16 v26, v0

    aput-byte v26, v25, v18

    .line 509
    add-int/lit8 v11, v11, -0x1

    move/from16 v15, v16

    .line 681
    .end local v16    # "p":I
    .restart local v15    # "p":I
    :goto_2
    const/16 v25, 0x102

    move/from16 v0, v25

    if-lt v11, v0, :cond_2

    const/16 v25, 0xa

    move/from16 v0, v25

    if-ge v14, v0, :cond_14

    .line 684
    :cond_2
    move-object/from16 v0, p7

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    move/from16 v25, v0

    sub-int v7, v25, v14

    .line 685
    .local v7, "c":I
    shr-int/lit8 v25, v10, 0x3

    move/from16 v0, v25

    if-ge v0, v7, :cond_3

    shr-int/lit8 v7, v10, 0x3

    .line 686
    :cond_3
    add-int/2addr v14, v7

    .line 687
    sub-int/2addr v15, v7

    .line 688
    shl-int/lit8 v25, v7, 0x3

    sub-int v10, v10, v25

    .line 690
    move-object/from16 v0, p6

    iput v6, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    .line 691
    move-object/from16 v0, p6

    iput v10, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    .line 692
    move-object/from16 v0, p7

    iput v14, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 693
    move-object/from16 v0, p7

    iget-wide v0, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    move-wide/from16 v26, v0

    move-object/from16 v0, p7

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    move/from16 v25, v0

    sub-int v25, v15, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v28, v0

    add-long v26, v26, v28

    move-wide/from16 v0, v26

    move-object/from16 v2, p7

    iput-wide v0, v2, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    .line 694
    move-object/from16 v0, p7

    iput v15, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 695
    move/from16 v0, v17

    move-object/from16 v1, p6

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 697
    const/16 v25, 0x0

    :goto_3
    return v25

    .line 514
    .end local v7    # "c":I
    .end local v15    # "p":I
    .end local v17    # "q":I
    .restart local v16    # "p":I
    .restart local v18    # "q":I
    :cond_4
    add-int/lit8 v25, v24, 0x1

    aget v25, v22, v25

    shr-int v6, v6, v25

    .line 515
    add-int/lit8 v25, v24, 0x1

    aget v25, v22, v25

    sub-int v10, v10, v25

    .line 517
    and-int/lit8 v25, v9, 0x10

    if-eqz v25, :cond_f

    .line 518
    and-int/lit8 v9, v9, 0xf

    .line 519
    add-int/lit8 v25, v24, 0x2

    aget v25, v22, v25

    sget-object v26, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->inflate_mask:[I

    aget v26, v26, v9

    and-int v26, v26, v6

    add-int v7, v25, v26

    .line 521
    .restart local v7    # "c":I
    shr-int/2addr v6, v9

    .line 522
    sub-int/2addr v10, v9

    .line 525
    :goto_4
    const/16 v25, 0xf

    move/from16 v0, v25

    if-ge v10, v0, :cond_5

    .line 526
    add-int/lit8 v14, v14, -0x1

    .line 527
    move-object/from16 v0, p7

    iget-object v0, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in:[B

    move-object/from16 v25, v0

    add-int/lit8 v15, v16, 0x1

    .end local v16    # "p":I
    .restart local v15    # "p":I
    aget-byte v25, v25, v16

    move/from16 v0, v25

    and-int/lit16 v0, v0, 0xff

    move/from16 v25, v0

    shl-int v25, v25, v10

    or-int v6, v6, v25

    .line 528
    add-int/lit8 v10, v10, 0x8

    move/from16 v16, v15

    .end local v15    # "p":I
    .restart local v16    # "p":I
    goto :goto_4

    .line 531
    :cond_5
    and-int v21, v6, v12

    .line 532
    move-object/from16 v22, p4

    .line 533
    move/from16 v23, p5

    .line 534
    add-int v25, v23, v21

    mul-int/lit8 v24, v25, 0x3

    .line 535
    aget v9, v22, v24

    .line 539
    :goto_5
    add-int/lit8 v25, v24, 0x1

    aget v25, v22, v25

    shr-int v6, v6, v25

    .line 540
    add-int/lit8 v25, v24, 0x1

    aget v25, v22, v25

    sub-int v10, v10, v25

    .line 542
    and-int/lit8 v25, v9, 0x10

    if-eqz v25, :cond_c

    .line 544
    and-int/lit8 v9, v9, 0xf

    .line 545
    :goto_6
    if-ge v10, v9, :cond_6

    .line 546
    add-int/lit8 v14, v14, -0x1

    .line 547
    move-object/from16 v0, p7

    iget-object v0, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in:[B

    move-object/from16 v25, v0

    add-int/lit8 v15, v16, 0x1

    .end local v16    # "p":I
    .restart local v15    # "p":I
    aget-byte v25, v25, v16

    move/from16 v0, v25

    and-int/lit16 v0, v0, 0xff

    move/from16 v25, v0

    shl-int v25, v25, v10

    or-int v6, v6, v25

    .line 548
    add-int/lit8 v10, v10, 0x8

    move/from16 v16, v15

    .end local v15    # "p":I
    .restart local v16    # "p":I
    goto :goto_6

    .line 551
    :cond_6
    add-int/lit8 v25, v24, 0x2

    aget v25, v22, v25

    sget-object v26, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->inflate_mask:[I

    aget v26, v26, v9

    and-int v26, v26, v6

    add-int v8, v25, v26

    .line 553
    .local v8, "d":I
    shr-int/2addr v6, v9

    .line 554
    sub-int/2addr v10, v9

    .line 557
    sub-int/2addr v11, v7

    .line 558
    move/from16 v0, v18

    if-lt v0, v8, :cond_8

    .line 560
    sub-int v19, v18, v8

    .line 561
    .local v19, "r":I
    sub-int v25, v18, v19

    if-lez v25, :cond_7

    const/16 v25, 0x2

    sub-int v26, v18, v19

    move/from16 v0, v25

    move/from16 v1, v26

    if-le v0, v1, :cond_7

    .line 562
    move-object/from16 v0, p6

    iget-object v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->window:[B

    move-object/from16 v25, v0

    add-int/lit8 v17, v18, 0x1

    .end local v18    # "q":I
    .restart local v17    # "q":I
    move-object/from16 v0, p6

    iget-object v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->window:[B

    move-object/from16 v26, v0

    add-int/lit8 v20, v19, 0x1

    .end local v19    # "r":I
    .local v20, "r":I
    aget-byte v26, v26, v19

    aput-byte v26, v25, v18

    .line 563
    move-object/from16 v0, p6

    iget-object v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->window:[B

    move-object/from16 v25, v0

    add-int/lit8 v18, v17, 0x1

    .end local v17    # "q":I
    .restart local v18    # "q":I
    move-object/from16 v0, p6

    iget-object v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->window:[B

    move-object/from16 v26, v0

    add-int/lit8 v19, v20, 0x1

    .end local v20    # "r":I
    .restart local v19    # "r":I
    aget-byte v26, v26, v20

    aput-byte v26, v25, v17

    .line 564
    add-int/lit8 v7, v7, -0x2

    move/from16 v17, v18

    .line 596
    .end local v18    # "q":I
    .restart local v17    # "q":I
    :goto_7
    sub-int v25, v17, v19

    if-lez v25, :cond_b

    sub-int v25, v17, v19

    move/from16 v0, v25

    if-le v7, v0, :cond_b

    .line 598
    :goto_8
    move-object/from16 v0, p6

    iget-object v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->window:[B

    move-object/from16 v25, v0

    add-int/lit8 v18, v17, 0x1

    .end local v17    # "q":I
    .restart local v18    # "q":I
    move-object/from16 v0, p6

    iget-object v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->window:[B

    move-object/from16 v26, v0

    add-int/lit8 v20, v19, 0x1

    .end local v19    # "r":I
    .restart local v20    # "r":I
    aget-byte v26, v26, v19

    aput-byte v26, v25, v17

    .line 599
    add-int/lit8 v7, v7, -0x1

    if-nez v7, :cond_15

    move/from16 v17, v18

    .end local v18    # "q":I
    .restart local v17    # "q":I
    move/from16 v15, v16

    .end local v16    # "p":I
    .restart local v15    # "p":I
    goto/16 :goto_2

    .line 566
    .end local v15    # "p":I
    .end local v17    # "q":I
    .end local v20    # "r":I
    .restart local v16    # "p":I
    .restart local v18    # "q":I
    .restart local v19    # "r":I
    :cond_7
    move-object/from16 v0, p6

    iget-object v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->window:[B

    move-object/from16 v25, v0

    move-object/from16 v0, p6

    iget-object v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->window:[B

    move-object/from16 v26, v0

    const/16 v27, 0x2

    move-object/from16 v0, v25

    move/from16 v1, v19

    move-object/from16 v2, v26

    move/from16 v3, v18

    move/from16 v4, v27

    invoke-static {v0, v1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 568
    add-int/lit8 v17, v18, 0x2

    .line 569
    .end local v18    # "q":I
    .restart local v17    # "q":I
    add-int/lit8 v19, v19, 0x2

    .line 570
    add-int/lit8 v7, v7, -0x2

    goto :goto_7

    .line 573
    .end local v17    # "q":I
    .end local v19    # "r":I
    .restart local v18    # "q":I
    :cond_8
    sub-int v19, v18, v8

    .line 575
    .restart local v19    # "r":I
    :cond_9
    move-object/from16 v0, p6

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->end:I

    move/from16 v25, v0

    add-int v19, v19, v25

    .line 576
    if-ltz v19, :cond_9

    .line 577
    move-object/from16 v0, p6

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->end:I

    move/from16 v25, v0

    sub-int v9, v25, v19

    .line 578
    if-le v7, v9, :cond_17

    .line 579
    sub-int/2addr v7, v9

    .line 580
    sub-int v25, v18, v19

    if-lez v25, :cond_a

    sub-int v25, v18, v19

    move/from16 v0, v25

    if-le v9, v0, :cond_a

    move/from16 v17, v18

    .line 582
    .end local v18    # "q":I
    .restart local v17    # "q":I
    :goto_9
    move-object/from16 v0, p6

    iget-object v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->window:[B

    move-object/from16 v25, v0

    add-int/lit8 v18, v17, 0x1

    .end local v17    # "q":I
    .restart local v18    # "q":I
    move-object/from16 v0, p6

    iget-object v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->window:[B

    move-object/from16 v26, v0

    add-int/lit8 v20, v19, 0x1

    .end local v19    # "r":I
    .restart local v20    # "r":I
    aget-byte v26, v26, v19

    aput-byte v26, v25, v17

    .line 583
    add-int/lit8 v9, v9, -0x1

    if-nez v9, :cond_16

    move/from16 v19, v20

    .end local v20    # "r":I
    .restart local v19    # "r":I
    move/from16 v17, v18

    .line 590
    .end local v18    # "q":I
    .restart local v17    # "q":I
    :goto_a
    const/16 v19, 0x0

    goto/16 :goto_7

    .line 585
    .end local v17    # "q":I
    .restart local v18    # "q":I
    :cond_a
    move-object/from16 v0, p6

    iget-object v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->window:[B

    move-object/from16 v25, v0

    move-object/from16 v0, p6

    iget-object v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->window:[B

    move-object/from16 v26, v0

    move-object/from16 v0, v25

    move/from16 v1, v19

    move-object/from16 v2, v26

    move/from16 v3, v18

    invoke-static {v0, v1, v2, v3, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 587
    add-int v17, v18, v9

    .line 588
    .end local v18    # "q":I
    .restart local v17    # "q":I
    add-int v19, v19, v9

    goto :goto_a

    .line 601
    :cond_b
    move-object/from16 v0, p6

    iget-object v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->window:[B

    move-object/from16 v25, v0

    move-object/from16 v0, p6

    iget-object v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->window:[B

    move-object/from16 v26, v0

    move-object/from16 v0, v25

    move/from16 v1, v19

    move-object/from16 v2, v26

    move/from16 v3, v17

    invoke-static {v0, v1, v2, v3, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 602
    add-int v17, v17, v7

    .line 603
    add-int v19, v19, v7

    move/from16 v15, v16

    .line 605
    .end local v16    # "p":I
    .restart local v15    # "p":I
    goto/16 :goto_2

    .line 606
    .end local v8    # "d":I
    .end local v15    # "p":I
    .end local v17    # "q":I
    .end local v19    # "r":I
    .restart local v16    # "p":I
    .restart local v18    # "q":I
    :cond_c
    and-int/lit8 v25, v9, 0x40

    if-nez v25, :cond_d

    .line 607
    add-int/lit8 v25, v24, 0x2

    aget v25, v22, v25

    add-int v21, v21, v25

    .line 608
    sget-object v25, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->inflate_mask:[I

    aget v25, v25, v9

    and-int v25, v25, v6

    add-int v21, v21, v25

    .line 609
    add-int v25, v23, v21

    mul-int/lit8 v24, v25, 0x3

    .line 610
    aget v9, v22, v24

    goto/16 :goto_5

    .line 612
    :cond_d
    const-string v25, "invalid distance code"

    move-object/from16 v0, v25

    move-object/from16 v1, p7

    iput-object v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->msg:Ljava/lang/String;

    .line 614
    move-object/from16 v0, p7

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    move/from16 v25, v0

    sub-int v7, v25, v14

    .line 615
    shr-int/lit8 v25, v10, 0x3

    move/from16 v0, v25

    if-ge v0, v7, :cond_e

    shr-int/lit8 v7, v10, 0x3

    .line 616
    :cond_e
    add-int/2addr v14, v7

    .line 617
    sub-int v15, v16, v7

    .line 618
    .end local v16    # "p":I
    .restart local v15    # "p":I
    shl-int/lit8 v25, v7, 0x3

    sub-int v10, v10, v25

    .line 620
    move-object/from16 v0, p6

    iput v6, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    .line 621
    move-object/from16 v0, p6

    iput v10, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    .line 622
    move-object/from16 v0, p7

    iput v14, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 623
    move-object/from16 v0, p7

    iget-wide v0, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    move-wide/from16 v26, v0

    move-object/from16 v0, p7

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    move/from16 v25, v0

    sub-int v25, v15, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v28, v0

    add-long v26, v26, v28

    move-wide/from16 v0, v26

    move-object/from16 v2, p7

    iput-wide v0, v2, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    .line 624
    move-object/from16 v0, p7

    iput v15, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 625
    move/from16 v0, v18

    move-object/from16 v1, p6

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 627
    const/16 v25, -0x3

    move/from16 v17, v18

    .end local v18    # "q":I
    .restart local v17    # "q":I
    goto/16 :goto_3

    .line 633
    .end local v7    # "c":I
    .end local v15    # "p":I
    .end local v17    # "q":I
    .restart local v16    # "p":I
    .restart local v18    # "q":I
    :cond_f
    and-int/lit8 v25, v9, 0x40

    if-nez v25, :cond_10

    .line 634
    add-int/lit8 v25, v24, 0x2

    aget v25, v22, v25

    add-int v21, v21, v25

    .line 635
    sget-object v25, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->inflate_mask:[I

    aget v25, v25, v9

    and-int v25, v25, v6

    add-int v21, v21, v25

    .line 636
    add-int v25, v23, v21

    mul-int/lit8 v24, v25, 0x3

    .line 637
    aget v9, v22, v24

    if-nez v9, :cond_4

    .line 639
    add-int/lit8 v25, v24, 0x1

    aget v25, v22, v25

    shr-int v6, v6, v25

    .line 640
    add-int/lit8 v25, v24, 0x1

    aget v25, v22, v25

    sub-int v10, v10, v25

    .line 642
    move-object/from16 v0, p6

    iget-object v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->window:[B

    move-object/from16 v25, v0

    add-int/lit8 v17, v18, 0x1

    .end local v18    # "q":I
    .restart local v17    # "q":I
    add-int/lit8 v26, v24, 0x2

    aget v26, v22, v26

    move/from16 v0, v26

    int-to-byte v0, v0

    move/from16 v26, v0

    aput-byte v26, v25, v18

    .line 643
    add-int/lit8 v11, v11, -0x1

    move/from16 v15, v16

    .line 644
    .end local v16    # "p":I
    .restart local v15    # "p":I
    goto/16 :goto_2

    .line 646
    .end local v15    # "p":I
    .end local v17    # "q":I
    .restart local v16    # "p":I
    .restart local v18    # "q":I
    :cond_10
    and-int/lit8 v25, v9, 0x20

    if-eqz v25, :cond_12

    .line 648
    move-object/from16 v0, p7

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    move/from16 v25, v0

    sub-int v7, v25, v14

    .line 649
    .restart local v7    # "c":I
    shr-int/lit8 v25, v10, 0x3

    move/from16 v0, v25

    if-ge v0, v7, :cond_11

    shr-int/lit8 v7, v10, 0x3

    .line 650
    :cond_11
    add-int/2addr v14, v7

    .line 651
    sub-int v15, v16, v7

    .line 652
    .end local v16    # "p":I
    .restart local v15    # "p":I
    shl-int/lit8 v25, v7, 0x3

    sub-int v10, v10, v25

    .line 654
    move-object/from16 v0, p6

    iput v6, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    .line 655
    move-object/from16 v0, p6

    iput v10, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    .line 656
    move-object/from16 v0, p7

    iput v14, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 657
    move-object/from16 v0, p7

    iget-wide v0, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    move-wide/from16 v26, v0

    move-object/from16 v0, p7

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    move/from16 v25, v0

    sub-int v25, v15, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v28, v0

    add-long v26, v26, v28

    move-wide/from16 v0, v26

    move-object/from16 v2, p7

    iput-wide v0, v2, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    .line 658
    move-object/from16 v0, p7

    iput v15, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 659
    move/from16 v0, v18

    move-object/from16 v1, p6

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 661
    const/16 v25, 0x1

    move/from16 v17, v18

    .end local v18    # "q":I
    .restart local v17    # "q":I
    goto/16 :goto_3

    .line 663
    .end local v7    # "c":I
    .end local v15    # "p":I
    .end local v17    # "q":I
    .restart local v16    # "p":I
    .restart local v18    # "q":I
    :cond_12
    const-string v25, "invalid literal/length code"

    move-object/from16 v0, v25

    move-object/from16 v1, p7

    iput-object v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->msg:Ljava/lang/String;

    .line 665
    move-object/from16 v0, p7

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    move/from16 v25, v0

    sub-int v7, v25, v14

    .line 666
    .restart local v7    # "c":I
    shr-int/lit8 v25, v10, 0x3

    move/from16 v0, v25

    if-ge v0, v7, :cond_13

    shr-int/lit8 v7, v10, 0x3

    .line 667
    :cond_13
    add-int/2addr v14, v7

    .line 668
    sub-int v15, v16, v7

    .line 669
    .end local v16    # "p":I
    .restart local v15    # "p":I
    shl-int/lit8 v25, v7, 0x3

    sub-int v10, v10, v25

    .line 671
    move-object/from16 v0, p6

    iput v6, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    .line 672
    move-object/from16 v0, p6

    iput v10, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    .line 673
    move-object/from16 v0, p7

    iput v14, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 674
    move-object/from16 v0, p7

    iget-wide v0, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    move-wide/from16 v26, v0

    move-object/from16 v0, p7

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    move/from16 v25, v0

    sub-int v25, v15, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v28, v0

    add-long v26, v26, v28

    move-wide/from16 v0, v26

    move-object/from16 v2, p7

    iput-wide v0, v2, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    .line 675
    move-object/from16 v0, p7

    iput v15, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 676
    move/from16 v0, v18

    move-object/from16 v1, p6

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 678
    const/16 v25, -0x3

    move/from16 v17, v18

    .end local v18    # "q":I
    .restart local v17    # "q":I
    goto/16 :goto_3

    .end local v7    # "c":I
    :cond_14
    move/from16 v18, v17

    .end local v17    # "q":I
    .restart local v18    # "q":I
    move/from16 v16, v15

    .end local v15    # "p":I
    .restart local v16    # "p":I
    goto/16 :goto_1

    .restart local v7    # "c":I
    .restart local v8    # "d":I
    .restart local v20    # "r":I
    :cond_15
    move/from16 v19, v20

    .end local v20    # "r":I
    .restart local v19    # "r":I
    move/from16 v17, v18

    .end local v18    # "q":I
    .restart local v17    # "q":I
    goto/16 :goto_8

    .end local v17    # "q":I
    .end local v19    # "r":I
    .restart local v18    # "q":I
    .restart local v20    # "r":I
    :cond_16
    move/from16 v19, v20

    .end local v20    # "r":I
    .restart local v19    # "r":I
    move/from16 v17, v18

    .end local v18    # "q":I
    .restart local v17    # "q":I
    goto/16 :goto_9

    .end local v17    # "q":I
    .restart local v18    # "q":I
    :cond_17
    move/from16 v17, v18

    .end local v18    # "q":I
    .restart local v17    # "q":I
    goto/16 :goto_7
.end method


# virtual methods
.method init(II[II[II)V
    .locals 1
    .param p1, "bl"    # I
    .param p2, "bd"    # I
    .param p3, "tl"    # [I
    .param p4, "tl_index"    # I
    .param p5, "td"    # [I
    .param p6, "td_index"    # I

    .prologue
    .line 88
    const/4 v0, 0x0

    iput v0, p0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->mode:I

    .line 89
    int-to-byte v0, p1

    iput-byte v0, p0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->lbits:B

    .line 90
    int-to-byte v0, p2

    iput-byte v0, p0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->dbits:B

    .line 91
    iput-object p3, p0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->ltree:[I

    .line 92
    iput p4, p0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->ltree_index:I

    .line 93
    iput-object p5, p0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->dtree:[I

    .line 94
    iput p6, p0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->dtree_index:I

    .line 95
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->tree:[I

    .line 96
    return-void
.end method

.method proc(Lorg/jboss/netty/util/internal/jzlib/InfBlocks;Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I
    .locals 23
    .param p1, "s"    # Lorg/jboss/netty/util/internal/jzlib/InfBlocks;
    .param p2, "z"    # Lorg/jboss/netty/util/internal/jzlib/ZStream;
    .param p3, "r"    # I

    .prologue
    .line 111
    move-object/from16 v0, p2

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    move/from16 v18, v0

    .line 112
    .local v18, "p":I
    move-object/from16 v0, p2

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    move/from16 v17, v0

    .line 113
    .local v17, "n":I
    move-object/from16 v0, p1

    iget v10, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    .line 114
    .local v10, "b":I
    move-object/from16 v0, p1

    iget v15, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    .line 115
    .local v15, "k":I
    move-object/from16 v0, p1

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    move/from16 v20, v0

    .line 116
    .local v20, "q":I
    move-object/from16 v0, p1

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->read:I

    move/from16 v0, v20

    if-ge v0, v2, :cond_0

    move-object/from16 v0, p1

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->read:I

    sub-int v2, v2, v20

    add-int/lit8 v16, v2, -0x1

    .line 120
    .local v16, "m":I
    :goto_0
    move-object/from16 v0, p0

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->mode:I

    packed-switch v2, :pswitch_data_0

    .line 441
    const/16 p3, -0x2

    .line 443
    move-object/from16 v0, p1

    iput v10, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    .line 444
    move-object/from16 v0, p1

    iput v15, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    .line 445
    move/from16 v0, v17

    move-object/from16 v1, p2

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 446
    move-object/from16 v0, p2

    iget-wide v2, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    move-object/from16 v0, p2

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    sub-int v4, v18, v4

    int-to-long v4, v4

    add-long/2addr v2, v4

    move-object/from16 v0, p2

    iput-wide v2, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    .line 447
    move/from16 v0, v18

    move-object/from16 v1, p2

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 448
    move/from16 v0, v20

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 449
    invoke-virtual/range {p1 .. p3}, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inflate_flush(Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I

    move-result v2

    :goto_1
    return v2

    .line 116
    .end local v16    # "m":I
    :cond_0
    move-object/from16 v0, p1

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->end:I

    sub-int v16, v2, v20

    goto :goto_0

    .line 123
    .restart local v16    # "m":I
    :pswitch_0
    const/16 v2, 0x102

    move/from16 v0, v16

    if-lt v0, v2, :cond_3

    const/16 v2, 0xa

    move/from16 v0, v17

    if-lt v0, v2, :cond_3

    .line 125
    move-object/from16 v0, p1

    iput v10, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    .line 126
    move-object/from16 v0, p1

    iput v15, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    .line 127
    move/from16 v0, v17

    move-object/from16 v1, p2

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 128
    move-object/from16 v0, p2

    iget-wide v2, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    move-object/from16 v0, p2

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    sub-int v4, v18, v4

    int-to-long v4, v4

    add-long/2addr v2, v4

    move-object/from16 v0, p2

    iput-wide v2, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    .line 129
    move/from16 v0, v18

    move-object/from16 v1, p2

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 130
    move/from16 v0, v20

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 131
    move-object/from16 v0, p0

    iget-byte v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->lbits:B

    move-object/from16 v0, p0

    iget-byte v3, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->dbits:B

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->ltree:[I

    move-object/from16 v0, p0

    iget v5, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->ltree_index:I

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->dtree:[I

    move-object/from16 v0, p0

    iget v7, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->dtree_index:I

    move-object/from16 v8, p1

    move-object/from16 v9, p2

    invoke-static/range {v2 .. v9}, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->inflate_fast(II[II[IILorg/jboss/netty/util/internal/jzlib/InfBlocks;Lorg/jboss/netty/util/internal/jzlib/ZStream;)I

    move-result p3

    .line 134
    move-object/from16 v0, p2

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    move/from16 v18, v0

    .line 135
    move-object/from16 v0, p2

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    move/from16 v17, v0

    .line 136
    move-object/from16 v0, p1

    iget v10, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    .line 137
    move-object/from16 v0, p1

    iget v15, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    .line 138
    move-object/from16 v0, p1

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    move/from16 v20, v0

    .line 139
    move-object/from16 v0, p1

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->read:I

    move/from16 v0, v20

    if-ge v0, v2, :cond_1

    move-object/from16 v0, p1

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->read:I

    sub-int v2, v2, v20

    add-int/lit8 v16, v2, -0x1

    .line 141
    :goto_2
    if-eqz p3, :cond_3

    .line 142
    const/4 v2, 0x1

    move/from16 v0, p3

    if-ne v0, v2, :cond_2

    const/4 v2, 0x7

    :goto_3
    move-object/from16 v0, p0

    iput v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->mode:I

    goto/16 :goto_0

    .line 139
    :cond_1
    move-object/from16 v0, p1

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->end:I

    sub-int v16, v2, v20

    goto :goto_2

    .line 142
    :cond_2
    const/16 v2, 0x9

    goto :goto_3

    .line 146
    :cond_3
    move-object/from16 v0, p0

    iget-byte v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->lbits:B

    move-object/from16 v0, p0

    iput v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->need:I

    .line 147
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->ltree:[I

    move-object/from16 v0, p0

    iput-object v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->tree:[I

    .line 148
    move-object/from16 v0, p0

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->ltree_index:I

    move-object/from16 v0, p0

    iput v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->tree_index:I

    .line 150
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->mode:I

    .line 152
    :pswitch_1
    move-object/from16 v0, p0

    iget v14, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->need:I

    .local v14, "j":I
    move/from16 v19, v18

    .line 154
    .end local v18    # "p":I
    .local v19, "p":I
    :goto_4
    if-ge v15, v14, :cond_5

    .line 155
    if-eqz v17, :cond_4

    .line 156
    const/16 p3, 0x0

    .line 167
    add-int/lit8 v17, v17, -0x1

    .line 168
    move-object/from16 v0, p2

    iget-object v2, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in:[B

    add-int/lit8 v18, v19, 0x1

    .end local v19    # "p":I
    .restart local v18    # "p":I
    aget-byte v2, v2, v19

    and-int/lit16 v2, v2, 0xff

    shl-int/2addr v2, v15

    or-int/2addr v10, v2

    .line 169
    add-int/lit8 v15, v15, 0x8

    move/from16 v19, v18

    .end local v18    # "p":I
    .restart local v19    # "p":I
    goto :goto_4

    .line 159
    :cond_4
    move-object/from16 v0, p1

    iput v10, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    .line 160
    move-object/from16 v0, p1

    iput v15, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    .line 161
    move/from16 v0, v17

    move-object/from16 v1, p2

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 162
    move-object/from16 v0, p2

    iget-wide v2, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    move-object/from16 v0, p2

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    sub-int v4, v19, v4

    int-to-long v4, v4

    add-long/2addr v2, v4

    move-object/from16 v0, p2

    iput-wide v2, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    .line 163
    move/from16 v0, v19

    move-object/from16 v1, p2

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 164
    move/from16 v0, v20

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 165
    invoke-virtual/range {p1 .. p3}, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inflate_flush(Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I

    move-result v2

    move/from16 v18, v19

    .end local v19    # "p":I
    .restart local v18    # "p":I
    goto/16 :goto_1

    .line 172
    .end local v18    # "p":I
    .restart local v19    # "p":I
    :cond_5
    move-object/from16 v0, p0

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->tree_index:I

    sget-object v3, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->inflate_mask:[I

    aget v3, v3, v14

    and-int/2addr v3, v10

    add-int/2addr v2, v3

    mul-int/lit8 v22, v2, 0x3

    .line 174
    .local v22, "tindex":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->tree:[I

    add-int/lit8 v3, v22, 0x1

    aget v2, v2, v3

    ushr-int/2addr v10, v2

    .line 175
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->tree:[I

    add-int/lit8 v3, v22, 0x1

    aget v2, v2, v3

    sub-int/2addr v15, v2

    .line 177
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->tree:[I

    aget v11, v2, v22

    .line 179
    .local v11, "e":I
    if-nez v11, :cond_6

    .line 180
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->tree:[I

    add-int/lit8 v3, v22, 0x2

    aget v2, v2, v3

    move-object/from16 v0, p0

    iput v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->lit:I

    .line 181
    const/4 v2, 0x6

    move-object/from16 v0, p0

    iput v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->mode:I

    move/from16 v18, v19

    .line 182
    .end local v19    # "p":I
    .restart local v18    # "p":I
    goto/16 :goto_0

    .line 184
    .end local v18    # "p":I
    .restart local v19    # "p":I
    :cond_6
    and-int/lit8 v2, v11, 0x10

    if-eqz v2, :cond_7

    .line 185
    and-int/lit8 v2, v11, 0xf

    move-object/from16 v0, p0

    iput v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->get:I

    .line 186
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->tree:[I

    add-int/lit8 v3, v22, 0x2

    aget v2, v2, v3

    move-object/from16 v0, p0

    iput v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->len:I

    .line 187
    const/4 v2, 0x2

    move-object/from16 v0, p0

    iput v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->mode:I

    move/from16 v18, v19

    .line 188
    .end local v19    # "p":I
    .restart local v18    # "p":I
    goto/16 :goto_0

    .line 190
    .end local v18    # "p":I
    .restart local v19    # "p":I
    :cond_7
    and-int/lit8 v2, v11, 0x40

    if-nez v2, :cond_8

    .line 191
    move-object/from16 v0, p0

    iput v11, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->need:I

    .line 192
    div-int/lit8 v2, v22, 0x3

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->tree:[I

    add-int/lit8 v4, v22, 0x2

    aget v3, v3, v4

    add-int/2addr v2, v3

    move-object/from16 v0, p0

    iput v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->tree_index:I

    move/from16 v18, v19

    .line 193
    .end local v19    # "p":I
    .restart local v18    # "p":I
    goto/16 :goto_0

    .line 195
    .end local v18    # "p":I
    .restart local v19    # "p":I
    :cond_8
    and-int/lit8 v2, v11, 0x20

    if-eqz v2, :cond_9

    .line 196
    const/4 v2, 0x7

    move-object/from16 v0, p0

    iput v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->mode:I

    move/from16 v18, v19

    .line 197
    .end local v19    # "p":I
    .restart local v18    # "p":I
    goto/16 :goto_0

    .line 199
    .end local v18    # "p":I
    .restart local v19    # "p":I
    :cond_9
    const/16 v2, 0x9

    move-object/from16 v0, p0

    iput v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->mode:I

    .line 200
    const-string v2, "invalid literal/length code"

    move-object/from16 v0, p2

    iput-object v2, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->msg:Ljava/lang/String;

    .line 201
    const/16 p3, -0x3

    .line 203
    move-object/from16 v0, p1

    iput v10, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    .line 204
    move-object/from16 v0, p1

    iput v15, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    .line 205
    move/from16 v0, v17

    move-object/from16 v1, p2

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 206
    move-object/from16 v0, p2

    iget-wide v2, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    move-object/from16 v0, p2

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    sub-int v4, v19, v4

    int-to-long v4, v4

    add-long/2addr v2, v4

    move-object/from16 v0, p2

    iput-wide v2, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    .line 207
    move/from16 v0, v19

    move-object/from16 v1, p2

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 208
    move/from16 v0, v20

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 209
    invoke-virtual/range {p1 .. p3}, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inflate_flush(Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I

    move-result v2

    move/from16 v18, v19

    .end local v19    # "p":I
    .restart local v18    # "p":I
    goto/16 :goto_1

    .line 212
    .end local v11    # "e":I
    .end local v14    # "j":I
    .end local v22    # "tindex":I
    :pswitch_2
    move-object/from16 v0, p0

    iget v14, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->get:I

    .restart local v14    # "j":I
    move/from16 v19, v18

    .line 214
    .end local v18    # "p":I
    .restart local v19    # "p":I
    :goto_5
    if-ge v15, v14, :cond_b

    .line 215
    if-eqz v17, :cond_a

    .line 216
    const/16 p3, 0x0

    .line 227
    add-int/lit8 v17, v17, -0x1

    .line 228
    move-object/from16 v0, p2

    iget-object v2, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in:[B

    add-int/lit8 v18, v19, 0x1

    .end local v19    # "p":I
    .restart local v18    # "p":I
    aget-byte v2, v2, v19

    and-int/lit16 v2, v2, 0xff

    shl-int/2addr v2, v15

    or-int/2addr v10, v2

    .line 229
    add-int/lit8 v15, v15, 0x8

    move/from16 v19, v18

    .end local v18    # "p":I
    .restart local v19    # "p":I
    goto :goto_5

    .line 219
    :cond_a
    move-object/from16 v0, p1

    iput v10, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    .line 220
    move-object/from16 v0, p1

    iput v15, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    .line 221
    move/from16 v0, v17

    move-object/from16 v1, p2

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 222
    move-object/from16 v0, p2

    iget-wide v2, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    move-object/from16 v0, p2

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    sub-int v4, v19, v4

    int-to-long v4, v4

    add-long/2addr v2, v4

    move-object/from16 v0, p2

    iput-wide v2, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    .line 223
    move/from16 v0, v19

    move-object/from16 v1, p2

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 224
    move/from16 v0, v20

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 225
    invoke-virtual/range {p1 .. p3}, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inflate_flush(Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I

    move-result v2

    move/from16 v18, v19

    .end local v19    # "p":I
    .restart local v18    # "p":I
    goto/16 :goto_1

    .line 232
    .end local v18    # "p":I
    .restart local v19    # "p":I
    :cond_b
    move-object/from16 v0, p0

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->len:I

    sget-object v3, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->inflate_mask:[I

    aget v3, v3, v14

    and-int/2addr v3, v10

    add-int/2addr v2, v3

    move-object/from16 v0, p0

    iput v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->len:I

    .line 234
    shr-int/2addr v10, v14

    .line 235
    sub-int/2addr v15, v14

    .line 237
    move-object/from16 v0, p0

    iget-byte v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->dbits:B

    move-object/from16 v0, p0

    iput v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->need:I

    .line 238
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->dtree:[I

    move-object/from16 v0, p0

    iput-object v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->tree:[I

    .line 239
    move-object/from16 v0, p0

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->dtree_index:I

    move-object/from16 v0, p0

    iput v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->tree_index:I

    .line 240
    const/4 v2, 0x3

    move-object/from16 v0, p0

    iput v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->mode:I

    move/from16 v18, v19

    .line 242
    .end local v14    # "j":I
    .end local v19    # "p":I
    .restart local v18    # "p":I
    :pswitch_3
    move-object/from16 v0, p0

    iget v14, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->need:I

    .restart local v14    # "j":I
    move/from16 v19, v18

    .line 244
    .end local v18    # "p":I
    .restart local v19    # "p":I
    :goto_6
    if-ge v15, v14, :cond_d

    .line 245
    if-eqz v17, :cond_c

    .line 246
    const/16 p3, 0x0

    .line 257
    add-int/lit8 v17, v17, -0x1

    .line 258
    move-object/from16 v0, p2

    iget-object v2, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in:[B

    add-int/lit8 v18, v19, 0x1

    .end local v19    # "p":I
    .restart local v18    # "p":I
    aget-byte v2, v2, v19

    and-int/lit16 v2, v2, 0xff

    shl-int/2addr v2, v15

    or-int/2addr v10, v2

    .line 259
    add-int/lit8 v15, v15, 0x8

    move/from16 v19, v18

    .end local v18    # "p":I
    .restart local v19    # "p":I
    goto :goto_6

    .line 249
    :cond_c
    move-object/from16 v0, p1

    iput v10, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    .line 250
    move-object/from16 v0, p1

    iput v15, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    .line 251
    move/from16 v0, v17

    move-object/from16 v1, p2

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 252
    move-object/from16 v0, p2

    iget-wide v2, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    move-object/from16 v0, p2

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    sub-int v4, v19, v4

    int-to-long v4, v4

    add-long/2addr v2, v4

    move-object/from16 v0, p2

    iput-wide v2, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    .line 253
    move/from16 v0, v19

    move-object/from16 v1, p2

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 254
    move/from16 v0, v20

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 255
    invoke-virtual/range {p1 .. p3}, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inflate_flush(Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I

    move-result v2

    move/from16 v18, v19

    .end local v19    # "p":I
    .restart local v18    # "p":I
    goto/16 :goto_1

    .line 262
    .end local v18    # "p":I
    .restart local v19    # "p":I
    :cond_d
    move-object/from16 v0, p0

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->tree_index:I

    sget-object v3, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->inflate_mask:[I

    aget v3, v3, v14

    and-int/2addr v3, v10

    add-int/2addr v2, v3

    mul-int/lit8 v22, v2, 0x3

    .line 264
    .restart local v22    # "tindex":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->tree:[I

    add-int/lit8 v3, v22, 0x1

    aget v2, v2, v3

    shr-int/2addr v10, v2

    .line 265
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->tree:[I

    add-int/lit8 v3, v22, 0x1

    aget v2, v2, v3

    sub-int/2addr v15, v2

    .line 267
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->tree:[I

    aget v11, v2, v22

    .line 268
    .restart local v11    # "e":I
    and-int/lit8 v2, v11, 0x10

    if-eqz v2, :cond_e

    .line 269
    and-int/lit8 v2, v11, 0xf

    move-object/from16 v0, p0

    iput v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->get:I

    .line 270
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->tree:[I

    add-int/lit8 v3, v22, 0x2

    aget v2, v2, v3

    move-object/from16 v0, p0

    iput v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->dist:I

    .line 271
    const/4 v2, 0x4

    move-object/from16 v0, p0

    iput v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->mode:I

    move/from16 v18, v19

    .line 272
    .end local v19    # "p":I
    .restart local v18    # "p":I
    goto/16 :goto_0

    .line 274
    .end local v18    # "p":I
    .restart local v19    # "p":I
    :cond_e
    and-int/lit8 v2, v11, 0x40

    if-nez v2, :cond_f

    .line 275
    move-object/from16 v0, p0

    iput v11, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->need:I

    .line 276
    div-int/lit8 v2, v22, 0x3

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->tree:[I

    add-int/lit8 v4, v22, 0x2

    aget v3, v3, v4

    add-int/2addr v2, v3

    move-object/from16 v0, p0

    iput v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->tree_index:I

    move/from16 v18, v19

    .line 277
    .end local v19    # "p":I
    .restart local v18    # "p":I
    goto/16 :goto_0

    .line 279
    .end local v18    # "p":I
    .restart local v19    # "p":I
    :cond_f
    const/16 v2, 0x9

    move-object/from16 v0, p0

    iput v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->mode:I

    .line 280
    const-string v2, "invalid distance code"

    move-object/from16 v0, p2

    iput-object v2, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->msg:Ljava/lang/String;

    .line 281
    const/16 p3, -0x3

    .line 283
    move-object/from16 v0, p1

    iput v10, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    .line 284
    move-object/from16 v0, p1

    iput v15, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    .line 285
    move/from16 v0, v17

    move-object/from16 v1, p2

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 286
    move-object/from16 v0, p2

    iget-wide v2, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    move-object/from16 v0, p2

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    sub-int v4, v19, v4

    int-to-long v4, v4

    add-long/2addr v2, v4

    move-object/from16 v0, p2

    iput-wide v2, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    .line 287
    move/from16 v0, v19

    move-object/from16 v1, p2

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 288
    move/from16 v0, v20

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 289
    invoke-virtual/range {p1 .. p3}, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inflate_flush(Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I

    move-result v2

    move/from16 v18, v19

    .end local v19    # "p":I
    .restart local v18    # "p":I
    goto/16 :goto_1

    .line 292
    .end local v11    # "e":I
    .end local v14    # "j":I
    .end local v22    # "tindex":I
    :pswitch_4
    move-object/from16 v0, p0

    iget v14, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->get:I

    .restart local v14    # "j":I
    move/from16 v19, v18

    .line 294
    .end local v18    # "p":I
    .restart local v19    # "p":I
    :goto_7
    if-ge v15, v14, :cond_11

    .line 295
    if-eqz v17, :cond_10

    .line 296
    const/16 p3, 0x0

    .line 307
    add-int/lit8 v17, v17, -0x1

    .line 308
    move-object/from16 v0, p2

    iget-object v2, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in:[B

    add-int/lit8 v18, v19, 0x1

    .end local v19    # "p":I
    .restart local v18    # "p":I
    aget-byte v2, v2, v19

    and-int/lit16 v2, v2, 0xff

    shl-int/2addr v2, v15

    or-int/2addr v10, v2

    .line 309
    add-int/lit8 v15, v15, 0x8

    move/from16 v19, v18

    .end local v18    # "p":I
    .restart local v19    # "p":I
    goto :goto_7

    .line 299
    :cond_10
    move-object/from16 v0, p1

    iput v10, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    .line 300
    move-object/from16 v0, p1

    iput v15, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    .line 301
    move/from16 v0, v17

    move-object/from16 v1, p2

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 302
    move-object/from16 v0, p2

    iget-wide v2, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    move-object/from16 v0, p2

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    sub-int v4, v19, v4

    int-to-long v4, v4

    add-long/2addr v2, v4

    move-object/from16 v0, p2

    iput-wide v2, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    .line 303
    move/from16 v0, v19

    move-object/from16 v1, p2

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 304
    move/from16 v0, v20

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 305
    invoke-virtual/range {p1 .. p3}, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inflate_flush(Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I

    move-result v2

    move/from16 v18, v19

    .end local v19    # "p":I
    .restart local v18    # "p":I
    goto/16 :goto_1

    .line 312
    .end local v18    # "p":I
    .restart local v19    # "p":I
    :cond_11
    move-object/from16 v0, p0

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->dist:I

    sget-object v3, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->inflate_mask:[I

    aget v3, v3, v14

    and-int/2addr v3, v10

    add-int/2addr v2, v3

    move-object/from16 v0, p0

    iput v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->dist:I

    .line 314
    shr-int/2addr v10, v14

    .line 315
    sub-int/2addr v15, v14

    .line 317
    const/4 v2, 0x5

    move-object/from16 v0, p0

    iput v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->mode:I

    move/from16 v18, v19

    .line 319
    .end local v14    # "j":I
    .end local v19    # "p":I
    .restart local v18    # "p":I
    :pswitch_5
    move-object/from16 v0, p0

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->dist:I

    sub-int v12, v20, v2

    .line 320
    .local v12, "f":I
    :goto_8
    if-gez v12, :cond_13

    .line 321
    move-object/from16 v0, p1

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->end:I

    add-int/2addr v12, v2

    goto :goto_8

    .line 353
    :cond_12
    move-object/from16 v0, p1

    iget-object v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->window:[B

    add-int/lit8 v21, v20, 0x1

    .end local v20    # "q":I
    .local v21, "q":I
    move-object/from16 v0, p1

    iget-object v3, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->window:[B

    add-int/lit8 v13, v12, 0x1

    .end local v12    # "f":I
    .local v13, "f":I
    aget-byte v3, v3, v12

    aput-byte v3, v2, v20

    .line 354
    add-int/lit8 v16, v16, -0x1

    .line 356
    move-object/from16 v0, p1

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->end:I

    if-ne v13, v2, :cond_22

    .line 357
    const/4 v12, 0x0

    .line 359
    .end local v13    # "f":I
    .restart local v12    # "f":I
    :goto_9
    move-object/from16 v0, p0

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->len:I

    add-int/lit8 v2, v2, -0x1

    move-object/from16 v0, p0

    iput v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->len:I

    move/from16 v20, v21

    .line 323
    .end local v21    # "q":I
    .restart local v20    # "q":I
    :cond_13
    move-object/from16 v0, p0

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->len:I

    if-eqz v2, :cond_19

    .line 325
    if-nez v16, :cond_12

    .line 326
    move-object/from16 v0, p1

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->end:I

    move/from16 v0, v20

    if-ne v0, v2, :cond_14

    move-object/from16 v0, p1

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->read:I

    if-eqz v2, :cond_14

    .line 327
    const/16 v20, 0x0

    .line 328
    move-object/from16 v0, p1

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->read:I

    move/from16 v0, v20

    if-ge v0, v2, :cond_16

    move-object/from16 v0, p1

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->read:I

    sub-int v2, v2, v20

    add-int/lit8 v16, v2, -0x1

    .line 330
    :cond_14
    :goto_a
    if-nez v16, :cond_12

    .line 331
    move/from16 v0, v20

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 332
    invoke-virtual/range {p1 .. p3}, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inflate_flush(Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I

    move-result p3

    .line 333
    move-object/from16 v0, p1

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    move/from16 v20, v0

    .line 334
    move-object/from16 v0, p1

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->read:I

    move/from16 v0, v20

    if-ge v0, v2, :cond_17

    move-object/from16 v0, p1

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->read:I

    sub-int v2, v2, v20

    add-int/lit8 v16, v2, -0x1

    .line 336
    :goto_b
    move-object/from16 v0, p1

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->end:I

    move/from16 v0, v20

    if-ne v0, v2, :cond_15

    move-object/from16 v0, p1

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->read:I

    if-eqz v2, :cond_15

    .line 337
    const/16 v20, 0x0

    .line 338
    move-object/from16 v0, p1

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->read:I

    move/from16 v0, v20

    if-ge v0, v2, :cond_18

    move-object/from16 v0, p1

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->read:I

    sub-int v2, v2, v20

    add-int/lit8 v16, v2, -0x1

    .line 341
    :cond_15
    :goto_c
    if-nez v16, :cond_12

    .line 342
    move-object/from16 v0, p1

    iput v10, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    .line 343
    move-object/from16 v0, p1

    iput v15, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    .line 344
    move/from16 v0, v17

    move-object/from16 v1, p2

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 345
    move-object/from16 v0, p2

    iget-wide v2, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    move-object/from16 v0, p2

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    sub-int v4, v18, v4

    int-to-long v4, v4

    add-long/2addr v2, v4

    move-object/from16 v0, p2

    iput-wide v2, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    .line 346
    move/from16 v0, v18

    move-object/from16 v1, p2

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 347
    move/from16 v0, v20

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 348
    invoke-virtual/range {p1 .. p3}, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inflate_flush(Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I

    move-result v2

    goto/16 :goto_1

    .line 328
    :cond_16
    move-object/from16 v0, p1

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->end:I

    sub-int v16, v2, v20

    goto :goto_a

    .line 334
    :cond_17
    move-object/from16 v0, p1

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->end:I

    sub-int v16, v2, v20

    goto :goto_b

    .line 338
    :cond_18
    move-object/from16 v0, p1

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->end:I

    sub-int v16, v2, v20

    goto :goto_c

    .line 361
    :cond_19
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->mode:I

    goto/16 :goto_0

    .line 364
    .end local v12    # "f":I
    :pswitch_6
    if-nez v16, :cond_1f

    .line 365
    move-object/from16 v0, p1

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->end:I

    move/from16 v0, v20

    if-ne v0, v2, :cond_1a

    move-object/from16 v0, p1

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->read:I

    if-eqz v2, :cond_1a

    .line 366
    const/16 v20, 0x0

    .line 367
    move-object/from16 v0, p1

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->read:I

    move/from16 v0, v20

    if-ge v0, v2, :cond_1c

    move-object/from16 v0, p1

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->read:I

    sub-int v2, v2, v20

    add-int/lit8 v16, v2, -0x1

    .line 369
    :cond_1a
    :goto_d
    if-nez v16, :cond_1f

    .line 370
    move/from16 v0, v20

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 371
    invoke-virtual/range {p1 .. p3}, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inflate_flush(Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I

    move-result p3

    .line 372
    move-object/from16 v0, p1

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    move/from16 v20, v0

    .line 373
    move-object/from16 v0, p1

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->read:I

    move/from16 v0, v20

    if-ge v0, v2, :cond_1d

    move-object/from16 v0, p1

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->read:I

    sub-int v2, v2, v20

    add-int/lit8 v16, v2, -0x1

    .line 375
    :goto_e
    move-object/from16 v0, p1

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->end:I

    move/from16 v0, v20

    if-ne v0, v2, :cond_1b

    move-object/from16 v0, p1

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->read:I

    if-eqz v2, :cond_1b

    .line 376
    const/16 v20, 0x0

    .line 377
    move-object/from16 v0, p1

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->read:I

    move/from16 v0, v20

    if-ge v0, v2, :cond_1e

    move-object/from16 v0, p1

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->read:I

    sub-int v2, v2, v20

    add-int/lit8 v16, v2, -0x1

    .line 379
    :cond_1b
    :goto_f
    if-nez v16, :cond_1f

    .line 380
    move-object/from16 v0, p1

    iput v10, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    .line 381
    move-object/from16 v0, p1

    iput v15, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    .line 382
    move/from16 v0, v17

    move-object/from16 v1, p2

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 383
    move-object/from16 v0, p2

    iget-wide v2, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    move-object/from16 v0, p2

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    sub-int v4, v18, v4

    int-to-long v4, v4

    add-long/2addr v2, v4

    move-object/from16 v0, p2

    iput-wide v2, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    .line 384
    move/from16 v0, v18

    move-object/from16 v1, p2

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 385
    move/from16 v0, v20

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 386
    invoke-virtual/range {p1 .. p3}, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inflate_flush(Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I

    move-result v2

    goto/16 :goto_1

    .line 367
    :cond_1c
    move-object/from16 v0, p1

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->end:I

    sub-int v16, v2, v20

    goto :goto_d

    .line 373
    :cond_1d
    move-object/from16 v0, p1

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->end:I

    sub-int v16, v2, v20

    goto :goto_e

    .line 377
    :cond_1e
    move-object/from16 v0, p1

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->end:I

    sub-int v16, v2, v20

    goto :goto_f

    .line 390
    :cond_1f
    const/16 p3, 0x0

    .line 392
    move-object/from16 v0, p1

    iget-object v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->window:[B

    add-int/lit8 v21, v20, 0x1

    .end local v20    # "q":I
    .restart local v21    # "q":I
    move-object/from16 v0, p0

    iget v3, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->lit:I

    int-to-byte v3, v3

    aput-byte v3, v2, v20

    .line 393
    add-int/lit8 v16, v16, -0x1

    .line 395
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->mode:I

    move/from16 v20, v21

    .line 396
    .end local v21    # "q":I
    .restart local v20    # "q":I
    goto/16 :goto_0

    .line 398
    :pswitch_7
    const/4 v2, 0x7

    if-le v15, v2, :cond_20

    .line 399
    add-int/lit8 v15, v15, -0x8

    .line 400
    add-int/lit8 v17, v17, 0x1

    .line 401
    add-int/lit8 v18, v18, -0x1

    .line 404
    :cond_20
    move/from16 v0, v20

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 405
    invoke-virtual/range {p1 .. p3}, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inflate_flush(Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I

    move-result p3

    .line 406
    move-object/from16 v0, p1

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    move/from16 v20, v0

    .line 408
    move-object/from16 v0, p1

    iget v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->read:I

    move-object/from16 v0, p1

    iget v3, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    if-eq v2, v3, :cond_21

    .line 409
    move-object/from16 v0, p1

    iput v10, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    .line 410
    move-object/from16 v0, p1

    iput v15, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    .line 411
    move/from16 v0, v17

    move-object/from16 v1, p2

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 412
    move-object/from16 v0, p2

    iget-wide v2, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    move-object/from16 v0, p2

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    sub-int v4, v18, v4

    int-to-long v4, v4

    add-long/2addr v2, v4

    move-object/from16 v0, p2

    iput-wide v2, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    .line 413
    move/from16 v0, v18

    move-object/from16 v1, p2

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 414
    move/from16 v0, v20

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 415
    invoke-virtual/range {p1 .. p3}, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inflate_flush(Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I

    move-result v2

    goto/16 :goto_1

    .line 417
    :cond_21
    const/16 v2, 0x8

    move-object/from16 v0, p0

    iput v2, v0, Lorg/jboss/netty/util/internal/jzlib/InfCodes;->mode:I

    .line 419
    :pswitch_8
    const/16 p3, 0x1

    .line 420
    move-object/from16 v0, p1

    iput v10, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    .line 421
    move-object/from16 v0, p1

    iput v15, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    .line 422
    move/from16 v0, v17

    move-object/from16 v1, p2

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 423
    move-object/from16 v0, p2

    iget-wide v2, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    move-object/from16 v0, p2

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    sub-int v4, v18, v4

    int-to-long v4, v4

    add-long/2addr v2, v4

    move-object/from16 v0, p2

    iput-wide v2, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    .line 424
    move/from16 v0, v18

    move-object/from16 v1, p2

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 425
    move/from16 v0, v20

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 426
    invoke-virtual/range {p1 .. p3}, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inflate_flush(Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I

    move-result v2

    goto/16 :goto_1

    .line 430
    :pswitch_9
    const/16 p3, -0x3

    .line 432
    move-object/from16 v0, p1

    iput v10, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitb:I

    .line 433
    move-object/from16 v0, p1

    iput v15, v0, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->bitk:I

    .line 434
    move/from16 v0, v17

    move-object/from16 v1, p2

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 435
    move-object/from16 v0, p2

    iget-wide v2, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    move-object/from16 v0, p2

    iget v4, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    sub-int v4, v18, v4

    int-to-long v4, v4

    add-long/2addr v2, v4

    move-object/from16 v0, p2

    iput-wide v2, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    .line 436
    move/from16 v0, v18

    move-object/from16 v1, p2

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 437
    move/from16 v0, v20

    move-object/from16 v1, p1

    iput v0, v1, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->write:I

    .line 438
    invoke-virtual/range {p1 .. p3}, Lorg/jboss/netty/util/internal/jzlib/InfBlocks;->inflate_flush(Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I

    move-result v2

    goto/16 :goto_1

    .end local v20    # "q":I
    .restart local v13    # "f":I
    .restart local v21    # "q":I
    :cond_22
    move v12, v13

    .end local v13    # "f":I
    .restart local v12    # "f":I
    goto/16 :goto_9

    .line 120
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
    .end packed-switch
.end method
