.class final Lorg/jboss/netty/util/internal/jzlib/Deflate;
.super Ljava/lang/Object;
.source "Deflate.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/util/internal/jzlib/Deflate$1;,
        Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;
    }
.end annotation


# static fields
.field private static final BUSY_STATE:I = 0x71

.field private static final BlockDone:I = 0x1

.field private static final Buf_size:I = 0x10

.field private static final DYN_TREES:I = 0x2

.field private static final END_BLOCK:I = 0x100

.field private static final FAST:I = 0x1

.field private static final FINISH_STATE:I = 0x29a

.field private static final FinishDone:I = 0x3

.field private static final FinishStarted:I = 0x2

.field private static final INIT_STATE:I = 0x2a

.field private static final MAX_MATCH:I = 0x102

.field private static final MIN_LOOKAHEAD:I = 0x106

.field private static final MIN_MATCH:I = 0x3

.field private static final NeedMore:I = 0x0

.field private static final REPZ_11_138:I = 0x12

.field private static final REPZ_3_10:I = 0x11

.field private static final REP_3_6:I = 0x10

.field private static final SLOW:I = 0x2

.field private static final STATIC_TREES:I = 0x1

.field private static final STORED:I = 0x0

.field private static final STORED_BLOCK:I = 0x0

.field private static final Z_ASCII:I = 0x1

.field private static final Z_BINARY:I = 0x0

.field private static final Z_UNKNOWN:I = 0x2

.field private static final config_table:[Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;

.field private static final z_errmsg:[Ljava/lang/String;


# instance fields
.field bi_buf:S

.field bi_valid:I

.field final bl_count:[S

.field final bl_desc:Lorg/jboss/netty/util/internal/jzlib/Tree;

.field final bl_tree:[S

.field block_start:I

.field d_buf:I

.field final d_desc:Lorg/jboss/netty/util/internal/jzlib/Tree;

.field data_type:B

.field final depth:[B

.field final dyn_dtree:[S

.field final dyn_ltree:[S

.field good_match:I

.field private gzipUncompressedBytes:I

.field hash_bits:I

.field hash_mask:I

.field hash_shift:I

.field hash_size:I

.field head:[S

.field final heap:[I

.field heap_len:I

.field heap_max:I

.field ins_h:I

.field l_buf:I

.field final l_desc:Lorg/jboss/netty/util/internal/jzlib/Tree;

.field last_eob_len:I

.field last_flush:I

.field last_lit:I

.field level:I

.field lit_bufsize:I

.field lookahead:I

.field match_available:I

.field match_length:I

.field match_start:I

.field matches:I

.field max_chain_length:I

.field max_lazy_match:I

.field nice_match:I

.field opt_len:I

.field pending:I

.field pending_buf:[B

.field pending_buf_size:I

.field pending_out:I

.field prev:[S

.field prev_length:I

.field prev_match:I

.field static_len:I

.field status:I

.field strategy:I

.field strm:Lorg/jboss/netty/util/internal/jzlib/ZStream;

.field strstart:I

.field w_bits:I

.field w_mask:I

.field w_size:I

.field window:[B

.field window_size:I

.field wrapperType:Lorg/jboss/netty/util/internal/jzlib/JZlib$WrapperType;

.field private wroteTrailer:Z


# direct methods
.method static constructor <clinit>()V
    .locals 13

    .prologue
    const/16 v12, 0x20

    const/16 v11, 0x8

    const/4 v1, 0x0

    const/4 v10, 0x2

    const/4 v9, 0x4

    .line 77
    const/16 v0, 0xa

    new-array v0, v0, [Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;

    sput-object v0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->config_table:[Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;

    .line 78
    sget-object v6, Lorg/jboss/netty/util/internal/jzlib/Deflate;->config_table:[Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;

    new-instance v0, Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;

    move v2, v1

    move v3, v1

    move v4, v1

    move v5, v1

    invoke-direct/range {v0 .. v5}, Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;-><init>(IIIII)V

    aput-object v0, v6, v1

    .line 79
    sget-object v0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->config_table:[Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;

    const/4 v8, 0x1

    new-instance v2, Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;

    const/4 v7, 0x1

    move v3, v9

    move v4, v9

    move v5, v11

    move v6, v9

    invoke-direct/range {v2 .. v7}, Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;-><init>(IIIII)V

    aput-object v2, v0, v8

    .line 80
    sget-object v0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->config_table:[Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;

    new-instance v2, Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;

    const/4 v4, 0x5

    const/16 v5, 0x10

    const/4 v7, 0x1

    move v3, v9

    move v6, v11

    invoke-direct/range {v2 .. v7}, Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;-><init>(IIIII)V

    aput-object v2, v0, v10

    .line 81
    sget-object v0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->config_table:[Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;

    const/4 v8, 0x3

    new-instance v2, Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;

    const/4 v4, 0x6

    const/4 v7, 0x1

    move v3, v9

    move v5, v12

    move v6, v12

    invoke-direct/range {v2 .. v7}, Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;-><init>(IIIII)V

    aput-object v2, v0, v8

    .line 83
    sget-object v0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->config_table:[Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;

    new-instance v2, Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;

    const/16 v5, 0x10

    const/16 v6, 0x10

    move v3, v9

    move v4, v9

    move v7, v10

    invoke-direct/range {v2 .. v7}, Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;-><init>(IIIII)V

    aput-object v2, v0, v9

    .line 84
    sget-object v0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->config_table:[Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;

    const/4 v8, 0x5

    new-instance v2, Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;

    const/16 v4, 0x10

    move v3, v11

    move v5, v12

    move v6, v12

    move v7, v10

    invoke-direct/range {v2 .. v7}, Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;-><init>(IIIII)V

    aput-object v2, v0, v8

    .line 85
    sget-object v0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->config_table:[Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;

    const/4 v8, 0x6

    new-instance v2, Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;

    const/16 v4, 0x10

    const/16 v5, 0x80

    const/16 v6, 0x80

    move v3, v11

    move v7, v10

    invoke-direct/range {v2 .. v7}, Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;-><init>(IIIII)V

    aput-object v2, v0, v8

    .line 86
    sget-object v0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->config_table:[Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;

    const/4 v8, 0x7

    new-instance v2, Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;

    const/16 v5, 0x80

    const/16 v6, 0x100

    move v3, v11

    move v4, v12

    move v7, v10

    invoke-direct/range {v2 .. v7}, Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;-><init>(IIIII)V

    aput-object v2, v0, v8

    .line 87
    sget-object v0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->config_table:[Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;

    new-instance v2, Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;

    const/16 v4, 0x80

    const/16 v5, 0x102

    const/16 v6, 0x400

    move v3, v12

    move v7, v10

    invoke-direct/range {v2 .. v7}, Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;-><init>(IIIII)V

    aput-object v2, v0, v11

    .line 88
    sget-object v0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->config_table:[Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;

    const/16 v8, 0x9

    new-instance v2, Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;

    const/16 v4, 0x102

    const/16 v5, 0x102

    const/16 v6, 0x1000

    move v3, v12

    move v7, v10

    invoke-direct/range {v2 .. v7}, Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;-><init>(IIIII)V

    aput-object v2, v0, v8

    .line 91
    const/16 v0, 0xa

    new-array v0, v0, [Ljava/lang/String;

    const-string v2, "need dictionary"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "stream end"

    aput-object v2, v0, v1

    const-string v1, ""

    aput-object v1, v0, v10

    const/4 v1, 0x3

    const-string v2, "file error"

    aput-object v2, v0, v1

    const-string v1, "stream error"

    aput-object v1, v0, v9

    const/4 v1, 0x5

    const-string v2, "data error"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "insufficient memory"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "buffer error"

    aput-object v2, v0, v1

    const-string v1, "incompatible version"

    aput-object v1, v0, v11

    const/16 v1, 0x9

    const-string v2, ""

    aput-object v2, v0, v1

    sput-object v0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->z_errmsg:[Ljava/lang/String;

    return-void
.end method

.method constructor <init>()V
    .locals 2

    .prologue
    const/16 v1, 0x23d

    .line 249
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 200
    new-instance v0, Lorg/jboss/netty/util/internal/jzlib/Tree;

    invoke-direct {v0}, Lorg/jboss/netty/util/internal/jzlib/Tree;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->l_desc:Lorg/jboss/netty/util/internal/jzlib/Tree;

    .line 201
    new-instance v0, Lorg/jboss/netty/util/internal/jzlib/Tree;

    invoke-direct {v0}, Lorg/jboss/netty/util/internal/jzlib/Tree;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->d_desc:Lorg/jboss/netty/util/internal/jzlib/Tree;

    .line 202
    new-instance v0, Lorg/jboss/netty/util/internal/jzlib/Tree;

    invoke-direct {v0}, Lorg/jboss/netty/util/internal/jzlib/Tree;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bl_desc:Lorg/jboss/netty/util/internal/jzlib/Tree;

    .line 204
    const/16 v0, 0x10

    new-array v0, v0, [S

    iput-object v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bl_count:[S

    .line 206
    new-array v0, v1, [I

    iput-object v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap:[I

    .line 212
    new-array v0, v1, [B

    iput-object v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->depth:[B

    .line 250
    const/16 v0, 0x47a

    new-array v0, v0, [S

    iput-object v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->dyn_ltree:[S

    .line 251
    const/16 v0, 0x7a

    new-array v0, v0, [S

    iput-object v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->dyn_dtree:[S

    .line 252
    const/16 v0, 0x4e

    new-array v0, v0, [S

    iput-object v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bl_tree:[S

    .line 253
    return-void
.end method

.method private _tr_align()V
    .locals 5

    .prologue
    const/16 v4, 0x100

    const/4 v3, 0x3

    const/4 v2, 0x2

    .line 548
    invoke-direct {p0, v2, v3}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->send_bits(II)V

    .line 549
    sget-object v0, Lorg/jboss/netty/util/internal/jzlib/StaticTree;->static_ltree:[S

    invoke-direct {p0, v4, v0}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->send_code(I[S)V

    .line 551
    invoke-direct {p0}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bi_flush()V

    .line 557
    iget v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->last_eob_len:I

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0xa

    iget v1, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bi_valid:I

    sub-int/2addr v0, v1

    const/16 v1, 0x9

    if-ge v0, v1, :cond_0

    .line 558
    invoke-direct {p0, v2, v3}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->send_bits(II)V

    .line 559
    sget-object v0, Lorg/jboss/netty/util/internal/jzlib/StaticTree;->static_ltree:[S

    invoke-direct {p0, v4, v0}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->send_code(I[S)V

    .line 560
    invoke-direct {p0}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bi_flush()V

    .line 562
    :cond_0
    const/4 v0, 0x7

    iput v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->last_eob_len:I

    .line 563
    return-void
.end method

.method private _tr_flush_block(IIZ)V
    .locals 8
    .param p1, "buf"    # I
    .param p2, "stored_len"    # I
    .param p3, "eof"    # Z

    .prologue
    const/4 v7, 0x3

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 813
    const/4 v0, 0x0

    .line 816
    .local v0, "max_blindex":I
    iget v5, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->level:I

    if-lez v5, :cond_3

    .line 818
    iget-byte v5, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->data_type:B

    const/4 v6, 0x2

    if-ne v5, v6, :cond_0

    .line 819
    invoke-direct {p0}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->set_data_type()V

    .line 823
    :cond_0
    iget-object v5, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->l_desc:Lorg/jboss/netty/util/internal/jzlib/Tree;

    invoke-virtual {v5, p0}, Lorg/jboss/netty/util/internal/jzlib/Tree;->build_tree(Lorg/jboss/netty/util/internal/jzlib/Deflate;)V

    .line 825
    iget-object v5, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->d_desc:Lorg/jboss/netty/util/internal/jzlib/Tree;

    invoke-virtual {v5, p0}, Lorg/jboss/netty/util/internal/jzlib/Tree;->build_tree(Lorg/jboss/netty/util/internal/jzlib/Deflate;)V

    .line 832
    invoke-direct {p0}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->build_bl_tree()I

    move-result v0

    .line 835
    iget v5, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->opt_len:I

    add-int/lit8 v5, v5, 0x3

    add-int/lit8 v5, v5, 0x7

    ushr-int/lit8 v1, v5, 0x3

    .line 836
    .local v1, "opt_lenb":I
    iget v5, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->static_len:I

    add-int/lit8 v5, v5, 0x3

    add-int/lit8 v5, v5, 0x7

    ushr-int/lit8 v2, v5, 0x3

    .line 838
    .local v2, "static_lenb":I
    if-gt v2, v1, :cond_1

    .line 839
    move v1, v2

    .line 845
    :cond_1
    :goto_0
    add-int/lit8 v5, p2, 0x4

    if-gt v5, v1, :cond_4

    const/4 v5, -0x1

    if-eq p1, v5, :cond_4

    .line 852
    invoke-direct {p0, p1, p2, p3}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->_tr_stored_block(IIZ)V

    .line 866
    :goto_1
    invoke-direct {p0}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->init_block()V

    .line 868
    if-eqz p3, :cond_2

    .line 869
    invoke-direct {p0}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bi_windup()V

    .line 871
    :cond_2
    return-void

    .line 842
    .end local v1    # "opt_lenb":I
    .end local v2    # "static_lenb":I
    :cond_3
    add-int/lit8 v2, p2, 0x5

    .restart local v2    # "static_lenb":I
    move v1, v2

    .restart local v1    # "opt_lenb":I
    goto :goto_0

    .line 853
    :cond_4
    if-ne v2, v1, :cond_6

    .line 854
    if-eqz p3, :cond_5

    :goto_2
    add-int/lit8 v3, v3, 0x2

    invoke-direct {p0, v3, v7}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->send_bits(II)V

    .line 855
    sget-object v3, Lorg/jboss/netty/util/internal/jzlib/StaticTree;->static_ltree:[S

    sget-object v4, Lorg/jboss/netty/util/internal/jzlib/StaticTree;->static_dtree:[S

    invoke-direct {p0, v3, v4}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->compress_block([S[S)V

    goto :goto_1

    :cond_5
    move v3, v4

    .line 854
    goto :goto_2

    .line 857
    :cond_6
    if-eqz p3, :cond_7

    :goto_3
    add-int/lit8 v3, v3, 0x4

    invoke-direct {p0, v3, v7}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->send_bits(II)V

    .line 858
    iget-object v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->l_desc:Lorg/jboss/netty/util/internal/jzlib/Tree;

    iget v3, v3, Lorg/jboss/netty/util/internal/jzlib/Tree;->max_code:I

    add-int/lit8 v3, v3, 0x1

    iget-object v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->d_desc:Lorg/jboss/netty/util/internal/jzlib/Tree;

    iget v4, v4, Lorg/jboss/netty/util/internal/jzlib/Tree;->max_code:I

    add-int/lit8 v4, v4, 0x1

    add-int/lit8 v5, v0, 0x1

    invoke-direct {p0, v3, v4, v5}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->send_all_trees(III)V

    .line 860
    iget-object v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->dyn_ltree:[S

    iget-object v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->dyn_dtree:[S

    invoke-direct {p0, v3, v4}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->compress_block([S[S)V

    goto :goto_1

    :cond_7
    move v3, v4

    .line 857
    goto :goto_3
.end method

.method private _tr_stored_block(IIZ)V
    .locals 3
    .param p1, "buf"    # I
    .param p2, "stored_len"    # I
    .param p3, "eof"    # Z

    .prologue
    const/4 v1, 0x1

    .line 802
    if-eqz p3, :cond_0

    move v0, v1

    :goto_0
    add-int/lit8 v0, v0, 0x0

    const/4 v2, 0x3

    invoke-direct {p0, v0, v2}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->send_bits(II)V

    .line 803
    invoke-direct {p0, p1, p2, v1}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->copy_block(IIZ)V

    .line 804
    return-void

    .line 802
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private _tr_tally(II)Z
    .locals 12
    .param p1, "dist"    # I
    .param p2, "lc"    # I

    .prologue
    const/4 v3, 0x1

    .line 571
    iget-object v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->pending_buf:[B

    iget v5, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->d_buf:I

    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->last_lit:I

    mul-int/lit8 v6, v6, 0x2

    add-int/2addr v5, v6

    ushr-int/lit8 v6, p1, 0x8

    int-to-byte v6, v6

    aput-byte v6, v4, v5

    .line 572
    iget-object v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->pending_buf:[B

    iget v5, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->d_buf:I

    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->last_lit:I

    mul-int/lit8 v6, v6, 0x2

    add-int/2addr v5, v6

    add-int/lit8 v5, v5, 0x1

    int-to-byte v6, p1

    aput-byte v6, v4, v5

    .line 574
    iget-object v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->pending_buf:[B

    iget v5, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->l_buf:I

    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->last_lit:I

    add-int/2addr v5, v6

    int-to-byte v6, p2

    aput-byte v6, v4, v5

    .line 575
    iget v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->last_lit:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->last_lit:I

    .line 577
    if-nez p1, :cond_0

    .line 579
    iget-object v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->dyn_ltree:[S

    mul-int/lit8 v5, p2, 0x2

    aget-short v6, v4, v5

    add-int/lit8 v6, v6, 0x1

    int-to-short v6, v6

    aput-short v6, v4, v5

    .line 588
    :goto_0
    iget v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->last_lit:I

    and-int/lit16 v4, v4, 0x1fff

    if-nez v4, :cond_3

    iget v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->level:I

    const/4 v5, 0x2

    if-le v4, v5, :cond_3

    .line 590
    iget v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->last_lit:I

    mul-int/lit8 v2, v4, 0x8

    .line 591
    .local v2, "out_length":I
    iget v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    iget v5, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->block_start:I

    sub-int v1, v4, v5

    .line 593
    .local v1, "in_length":I
    const/4 v0, 0x0

    .local v0, "dcode":I
    :goto_1
    const/16 v4, 0x1e

    if-ge v0, v4, :cond_1

    .line 594
    int-to-long v4, v2

    iget-object v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->dyn_dtree:[S

    mul-int/lit8 v7, v0, 0x2

    aget-short v6, v6, v7

    int-to-long v6, v6

    const-wide/16 v8, 0x5

    sget-object v10, Lorg/jboss/netty/util/internal/jzlib/Tree;->extra_dbits:[I

    aget v10, v10, v0

    int-to-long v10, v10

    add-long/2addr v8, v10

    mul-long/2addr v6, v8

    add-long/2addr v4, v6

    long-to-int v2, v4

    .line 593
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 581
    .end local v0    # "dcode":I
    .end local v1    # "in_length":I
    .end local v2    # "out_length":I
    :cond_0
    iget v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->matches:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->matches:I

    .line 583
    add-int/lit8 p1, p1, -0x1

    .line 584
    iget-object v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->dyn_ltree:[S

    sget-object v5, Lorg/jboss/netty/util/internal/jzlib/Tree;->_length_code:[B

    aget-byte v5, v5, p2

    add-int/lit16 v5, v5, 0x100

    add-int/lit8 v5, v5, 0x1

    mul-int/lit8 v5, v5, 0x2

    aget-short v6, v4, v5

    add-int/lit8 v6, v6, 0x1

    int-to-short v6, v6

    aput-short v6, v4, v5

    .line 585
    iget-object v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->dyn_dtree:[S

    invoke-static {p1}, Lorg/jboss/netty/util/internal/jzlib/Tree;->d_code(I)I

    move-result v5

    mul-int/lit8 v5, v5, 0x2

    aget-short v6, v4, v5

    add-int/lit8 v6, v6, 0x1

    int-to-short v6, v6

    aput-short v6, v4, v5

    goto :goto_0

    .line 597
    .restart local v0    # "dcode":I
    .restart local v1    # "in_length":I
    .restart local v2    # "out_length":I
    :cond_1
    ushr-int/lit8 v2, v2, 0x3

    .line 598
    iget v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->matches:I

    iget v5, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->last_lit:I

    div-int/lit8 v5, v5, 0x2

    if-ge v4, v5, :cond_3

    div-int/lit8 v4, v1, 0x2

    if-ge v2, v4, :cond_3

    .line 603
    .end local v0    # "dcode":I
    .end local v1    # "in_length":I
    .end local v2    # "out_length":I
    :cond_2
    :goto_2
    return v3

    :cond_3
    iget v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->last_lit:I

    iget v5, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lit_bufsize:I

    add-int/lit8 v5, v5, -0x1

    if-eq v4, v5, :cond_2

    const/4 v3, 0x0

    goto :goto_2
.end method

.method private bi_flush()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 680
    iget v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bi_valid:I

    const/16 v1, 0x10

    if-ne v0, v1, :cond_1

    .line 681
    iget-short v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bi_buf:S

    invoke-direct {p0, v0}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->put_short(I)V

    .line 682
    iput-short v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bi_buf:S

    .line 683
    iput v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bi_valid:I

    .line 689
    :cond_0
    :goto_0
    return-void

    .line 684
    :cond_1
    iget v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bi_valid:I

    const/16 v1, 0x8

    if-lt v0, v1, :cond_0

    .line 685
    iget-short v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bi_buf:S

    int-to-byte v0, v0

    invoke-direct {p0, v0}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->put_byte(B)V

    .line 686
    iget-short v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bi_buf:S

    ushr-int/lit8 v0, v0, 0x8

    int-to-short v0, v0

    iput-short v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bi_buf:S

    .line 687
    iget v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bi_valid:I

    add-int/lit8 v0, v0, -0x8

    iput v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bi_valid:I

    goto :goto_0
.end method

.method private bi_windup()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 693
    iget v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bi_valid:I

    const/16 v1, 0x8

    if-le v0, v1, :cond_1

    .line 694
    iget-short v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bi_buf:S

    invoke-direct {p0, v0}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->put_short(I)V

    .line 698
    :cond_0
    :goto_0
    iput-short v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bi_buf:S

    .line 699
    iput v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bi_valid:I

    .line 700
    return-void

    .line 695
    :cond_1
    iget v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bi_valid:I

    if-lez v0, :cond_0

    .line 696
    iget-short v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bi_buf:S

    int-to-byte v0, v0

    invoke-direct {p0, v0}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->put_byte(B)V

    goto :goto_0
.end method

.method private build_bl_tree()I
    .locals 3

    .prologue
    .line 401
    iget-object v1, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->dyn_ltree:[S

    iget-object v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->l_desc:Lorg/jboss/netty/util/internal/jzlib/Tree;

    iget v2, v2, Lorg/jboss/netty/util/internal/jzlib/Tree;->max_code:I

    invoke-direct {p0, v1, v2}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->scan_tree([SI)V

    .line 402
    iget-object v1, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->dyn_dtree:[S

    iget-object v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->d_desc:Lorg/jboss/netty/util/internal/jzlib/Tree;

    iget v2, v2, Lorg/jboss/netty/util/internal/jzlib/Tree;->max_code:I

    invoke-direct {p0, v1, v2}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->scan_tree([SI)V

    .line 405
    iget-object v1, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bl_desc:Lorg/jboss/netty/util/internal/jzlib/Tree;

    invoke-virtual {v1, p0}, Lorg/jboss/netty/util/internal/jzlib/Tree;->build_tree(Lorg/jboss/netty/util/internal/jzlib/Deflate;)V

    .line 412
    const/16 v0, 0x12

    .local v0, "max_blindex":I
    :goto_0
    const/4 v1, 0x3

    if-lt v0, v1, :cond_0

    .line 413
    iget-object v1, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bl_tree:[S

    sget-object v2, Lorg/jboss/netty/util/internal/jzlib/Tree;->bl_order:[B

    aget-byte v2, v2, v0

    mul-int/lit8 v2, v2, 0x2

    add-int/lit8 v2, v2, 0x1

    aget-short v1, v1, v2

    if-eqz v1, :cond_1

    .line 418
    :cond_0
    iget v1, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->opt_len:I

    add-int/lit8 v2, v0, 0x1

    mul-int/lit8 v2, v2, 0x3

    add-int/lit8 v2, v2, 0x5

    add-int/lit8 v2, v2, 0x5

    add-int/lit8 v2, v2, 0x4

    add-int/2addr v1, v2

    iput v1, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->opt_len:I

    .line 420
    return v0

    .line 412
    :cond_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method

.method private compress_block([S[S)V
    .locals 9
    .param p1, "ltree"    # [S
    .param p2, "dtree"    # [S

    .prologue
    .line 613
    const/4 v4, 0x0

    .line 617
    .local v4, "lx":I
    iget v5, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->last_lit:I

    if-eqz v5, :cond_2

    .line 619
    :cond_0
    iget-object v5, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->pending_buf:[B

    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->d_buf:I

    mul-int/lit8 v7, v4, 0x2

    add-int/2addr v6, v7

    aget-byte v5, v5, v6

    shl-int/lit8 v5, v5, 0x8

    const v6, 0xff00

    and-int/2addr v5, v6

    iget-object v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->pending_buf:[B

    iget v7, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->d_buf:I

    mul-int/lit8 v8, v4, 0x2

    add-int/2addr v7, v8

    add-int/lit8 v7, v7, 0x1

    aget-byte v6, v6, v7

    and-int/lit16 v6, v6, 0xff

    or-int v1, v5, v6

    .line 621
    .local v1, "dist":I
    iget-object v5, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->pending_buf:[B

    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->l_buf:I

    add-int/2addr v6, v4

    aget-byte v5, v5, v6

    and-int/lit16 v3, v5, 0xff

    .line 622
    .local v3, "lc":I
    add-int/lit8 v4, v4, 0x1

    .line 624
    if-nez v1, :cond_3

    .line 625
    invoke-direct {p0, v3, p1}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->send_code(I[S)V

    .line 648
    :cond_1
    :goto_0
    iget v5, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->last_lit:I

    if-lt v4, v5, :cond_0

    .line 651
    .end local v1    # "dist":I
    .end local v3    # "lc":I
    :cond_2
    const/16 v5, 0x100

    invoke-direct {p0, v5, p1}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->send_code(I[S)V

    .line 652
    const/16 v5, 0x201

    aget-short v5, p1, v5

    iput v5, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->last_eob_len:I

    .line 653
    return-void

    .line 628
    .restart local v1    # "dist":I
    .restart local v3    # "lc":I
    :cond_3
    sget-object v5, Lorg/jboss/netty/util/internal/jzlib/Tree;->_length_code:[B

    aget-byte v0, v5, v3

    .line 630
    .local v0, "code":I
    add-int/lit16 v5, v0, 0x100

    add-int/lit8 v5, v5, 0x1

    invoke-direct {p0, v5, p1}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->send_code(I[S)V

    .line 631
    sget-object v5, Lorg/jboss/netty/util/internal/jzlib/Tree;->extra_lbits:[I

    aget v2, v5, v0

    .line 632
    .local v2, "extra":I
    if-eqz v2, :cond_4

    .line 633
    sget-object v5, Lorg/jboss/netty/util/internal/jzlib/Tree;->base_length:[I

    aget v5, v5, v0

    sub-int/2addr v3, v5

    .line 634
    invoke-direct {p0, v3, v2}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->send_bits(II)V

    .line 636
    :cond_4
    add-int/lit8 v1, v1, -0x1

    .line 637
    invoke-static {v1}, Lorg/jboss/netty/util/internal/jzlib/Tree;->d_code(I)I

    move-result v0

    .line 639
    invoke-direct {p0, v0, p2}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->send_code(I[S)V

    .line 640
    sget-object v5, Lorg/jboss/netty/util/internal/jzlib/Tree;->extra_dbits:[I

    aget v2, v5, v0

    .line 641
    if-eqz v2, :cond_1

    .line 642
    sget-object v5, Lorg/jboss/netty/util/internal/jzlib/Tree;->base_dist:[I

    aget v5, v5, v0

    sub-int/2addr v1, v5

    .line 643
    invoke-direct {p0, v1, v2}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->send_bits(II)V

    goto :goto_0
.end method

.method private copy_block(IIZ)V
    .locals 1
    .param p1, "buf"    # I
    .param p2, "len"    # I
    .param p3, "header"    # Z

    .prologue
    .line 708
    invoke-direct {p0}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bi_windup()V

    .line 709
    const/16 v0, 0x8

    iput v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->last_eob_len:I

    .line 711
    if-eqz p3, :cond_0

    .line 712
    int-to-short v0, p2

    invoke-direct {p0, v0}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->put_short(I)V

    .line 713
    xor-int/lit8 v0, p2, -0x1

    int-to-short v0, v0

    invoke-direct {p0, v0}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->put_short(I)V

    .line 720
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    invoke-direct {p0, v0, p1, p2}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->put_byte([BII)V

    .line 721
    return-void
.end method

.method private deflateInit2(Lorg/jboss/netty/util/internal/jzlib/ZStream;IIIIILorg/jboss/netty/util/internal/jzlib/JZlib$WrapperType;)I
    .locals 3
    .param p1, "strm"    # Lorg/jboss/netty/util/internal/jzlib/ZStream;
    .param p2, "level"    # I
    .param p3, "method"    # I
    .param p4, "windowBits"    # I
    .param p5, "memLevel"    # I
    .param p6, "strategy"    # I
    .param p7, "wrapperType"    # Lorg/jboss/netty/util/internal/jzlib/JZlib$WrapperType;

    .prologue
    const/16 v2, 0x9

    const/4 v1, 0x1

    .line 1312
    sget-object v0, Lorg/jboss/netty/util/internal/jzlib/JZlib$WrapperType;->ZLIB_OR_NONE:Lorg/jboss/netty/util/internal/jzlib/JZlib$WrapperType;

    if-ne p7, v0, :cond_0

    .line 1313
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "ZLIB_OR_NONE allowed only for inflate"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1324
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->msg:Ljava/lang/String;

    .line 1326
    const/4 v0, -0x1

    if-ne p2, v0, :cond_1

    .line 1327
    const/4 p2, 0x6

    .line 1330
    :cond_1
    if-gez p4, :cond_2

    .line 1331
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "windowBits: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1334
    :cond_2
    if-lt p5, v1, :cond_3

    if-gt p5, v2, :cond_3

    const/16 v0, 0x8

    if-ne p3, v0, :cond_3

    if-lt p4, v2, :cond_3

    const/16 v0, 0xf

    if-gt p4, v0, :cond_3

    if-ltz p2, :cond_3

    if-gt p2, v2, :cond_3

    if-ltz p6, :cond_3

    const/4 v0, 0x2

    if-le p6, v0, :cond_4

    .line 1338
    :cond_3
    const/4 v0, -0x2

    .line 1373
    :goto_0
    return v0

    .line 1341
    :cond_4
    iput-object p0, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->dstate:Lorg/jboss/netty/util/internal/jzlib/Deflate;

    .line 1343
    iput-object p7, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->wrapperType:Lorg/jboss/netty/util/internal/jzlib/JZlib$WrapperType;

    .line 1344
    iput p4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->w_bits:I

    .line 1345
    iget v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->w_bits:I

    shl-int v0, v1, v0

    iput v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->w_size:I

    .line 1346
    iget v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->w_size:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->w_mask:I

    .line 1348
    add-int/lit8 v0, p5, 0x7

    iput v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->hash_bits:I

    .line 1349
    iget v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->hash_bits:I

    shl-int v0, v1, v0

    iput v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->hash_size:I

    .line 1350
    iget v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->hash_size:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->hash_mask:I

    .line 1351
    iget v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->hash_bits:I

    add-int/lit8 v0, v0, 0x3

    add-int/lit8 v0, v0, -0x1

    div-int/lit8 v0, v0, 0x3

    iput v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->hash_shift:I

    .line 1353
    iget v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->w_size:I

    mul-int/lit8 v0, v0, 0x2

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    .line 1354
    iget v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->w_size:I

    new-array v0, v0, [S

    iput-object v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->prev:[S

    .line 1355
    iget v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->hash_size:I

    new-array v0, v0, [S

    iput-object v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->head:[S

    .line 1357
    add-int/lit8 v0, p5, 0x6

    shl-int v0, v1, v0

    iput v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lit_bufsize:I

    .line 1361
    iget v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lit_bufsize:I

    mul-int/lit8 v0, v0, 0x4

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->pending_buf:[B

    .line 1362
    iget v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lit_bufsize:I

    mul-int/lit8 v0, v0, 0x4

    iput v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->pending_buf_size:I

    .line 1364
    iget v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lit_bufsize:I

    div-int/lit8 v0, v0, 0x2

    iput v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->d_buf:I

    .line 1365
    iget v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lit_bufsize:I

    mul-int/lit8 v0, v0, 0x3

    iput v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->l_buf:I

    .line 1367
    iput p2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->level:I

    .line 1371
    iput p6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strategy:I

    .line 1373
    invoke-direct {p0, p1}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->deflateReset(Lorg/jboss/netty/util/internal/jzlib/ZStream;)I

    move-result v0

    goto :goto_0
.end method

.method private deflateReset(Lorg/jboss/netty/util/internal/jzlib/ZStream;)I
    .locals 6
    .param p1, "strm"    # Lorg/jboss/netty/util/internal/jzlib/ZStream;

    .prologue
    const-wide/16 v4, 0x0

    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 1377
    iput-wide v4, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_out:J

    iput-wide v4, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    .line 1378
    iput-object v3, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->msg:Ljava/lang/String;

    .line 1380
    iput v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->pending:I

    .line 1381
    iput v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->pending_out:I

    .line 1383
    iput-boolean v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->wroteTrailer:Z

    .line 1384
    iget-object v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->wrapperType:Lorg/jboss/netty/util/internal/jzlib/JZlib$WrapperType;

    sget-object v1, Lorg/jboss/netty/util/internal/jzlib/JZlib$WrapperType;->NONE:Lorg/jboss/netty/util/internal/jzlib/JZlib$WrapperType;

    if-ne v0, v1, :cond_0

    const/16 v0, 0x71

    :goto_0
    iput v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->status:I

    .line 1385
    invoke-static {v4, v5, v3, v2, v2}, Lorg/jboss/netty/util/internal/jzlib/Adler32;->adler32(J[BII)J

    move-result-wide v0

    iput-wide v0, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->adler:J

    .line 1386
    iput v2, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->crc32:I

    .line 1387
    iput v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->gzipUncompressedBytes:I

    .line 1389
    iput v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->last_flush:I

    .line 1391
    invoke-direct {p0}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->tr_init()V

    .line 1392
    invoke-direct {p0}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lm_init()V

    .line 1393
    return v2

    .line 1384
    :cond_0
    const/16 v0, 0x2a

    goto :goto_0
.end method

.method private deflate_fast(I)I
    .locals 12
    .param p1, "flush"    # I

    .prologue
    const/4 v3, 0x1

    const v11, 0xffff

    const/4 v10, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x0

    .line 965
    const/4 v1, 0x0

    .line 973
    .local v1, "hash_head":I
    :cond_0
    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lookahead:I

    const/16 v6, 0x106

    if-ge v2, v6, :cond_3

    .line 974
    invoke-direct {p0}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->fill_window()V

    .line 975
    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lookahead:I

    const/16 v6, 0x106

    if-ge v2, v6, :cond_2

    if-nez p1, :cond_2

    .line 1069
    :cond_1
    :goto_0
    return v4

    .line 978
    :cond_2
    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lookahead:I

    if-nez v2, :cond_3

    .line 1061
    if-ne p1, v10, :cond_9

    move v2, v3

    :goto_1
    invoke-direct {p0, v2}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->flush_block_only(Z)V

    .line 1062
    iget-object v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strm:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    iget v2, v2, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_out:I

    if-nez v2, :cond_a

    .line 1063
    if-ne p1, v10, :cond_1

    .line 1064
    const/4 v4, 0x2

    goto :goto_0

    .line 985
    :cond_3
    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lookahead:I

    if-lt v2, v5, :cond_4

    .line 986
    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->ins_h:I

    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->hash_shift:I

    shl-int/2addr v2, v6

    iget-object v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    iget v7, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    add-int/lit8 v7, v7, 0x3

    add-int/lit8 v7, v7, -0x1

    aget-byte v6, v6, v7

    and-int/lit16 v6, v6, 0xff

    xor-int/2addr v2, v6

    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->hash_mask:I

    and-int/2addr v2, v6

    iput v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->ins_h:I

    .line 990
    iget-object v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->head:[S

    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->ins_h:I

    aget-short v2, v2, v6

    and-int v1, v2, v11

    .line 991
    iget-object v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->prev:[S

    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    iget v7, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->w_mask:I

    and-int/2addr v6, v7

    iget-object v7, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->head:[S

    iget v8, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->ins_h:I

    aget-short v7, v7, v8

    aput-short v7, v2, v6

    .line 992
    iget-object v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->head:[S

    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->ins_h:I

    iget v7, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    int-to-short v7, v7

    aput-short v7, v2, v6

    .line 998
    :cond_4
    int-to-long v6, v1

    const-wide/16 v8, 0x0

    cmp-long v2, v6, v8

    if-eqz v2, :cond_5

    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    sub-int/2addr v2, v1

    and-int/2addr v2, v11

    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->w_size:I

    add-int/lit16 v6, v6, -0x106

    if-gt v2, v6, :cond_5

    .line 1003
    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strategy:I

    const/4 v6, 0x2

    if-eq v2, v6, :cond_5

    .line 1004
    invoke-direct {p0, v1}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->longest_match(I)I

    move-result v2

    iput v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->match_length:I

    .line 1008
    :cond_5
    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->match_length:I

    if-lt v2, v5, :cond_8

    .line 1011
    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->match_start:I

    sub-int/2addr v2, v6

    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->match_length:I

    add-int/lit8 v6, v6, -0x3

    invoke-direct {p0, v2, v6}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->_tr_tally(II)Z

    move-result v0

    .line 1014
    .local v0, "bflush":Z
    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lookahead:I

    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->match_length:I

    sub-int/2addr v2, v6

    iput v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lookahead:I

    .line 1018
    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->match_length:I

    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->max_lazy_match:I

    if-gt v2, v6, :cond_7

    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lookahead:I

    if-lt v2, v5, :cond_7

    .line 1019
    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->match_length:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->match_length:I

    .line 1021
    :cond_6
    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    .line 1023
    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->ins_h:I

    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->hash_shift:I

    shl-int/2addr v2, v6

    iget-object v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    iget v7, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    add-int/lit8 v7, v7, 0x3

    add-int/lit8 v7, v7, -0x1

    aget-byte v6, v6, v7

    and-int/lit16 v6, v6, 0xff

    xor-int/2addr v2, v6

    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->hash_mask:I

    and-int/2addr v2, v6

    iput v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->ins_h:I

    .line 1027
    iget-object v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->head:[S

    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->ins_h:I

    aget-short v2, v2, v6

    and-int v1, v2, v11

    .line 1028
    iget-object v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->prev:[S

    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    iget v7, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->w_mask:I

    and-int/2addr v6, v7

    iget-object v7, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->head:[S

    iget v8, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->ins_h:I

    aget-short v7, v7, v8

    aput-short v7, v2, v6

    .line 1029
    iget-object v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->head:[S

    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->ins_h:I

    iget v7, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    int-to-short v7, v7

    aput-short v7, v2, v6

    .line 1033
    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->match_length:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->match_length:I

    if-nez v2, :cond_6

    .line 1034
    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    .line 1052
    :goto_2
    if-eqz v0, :cond_0

    .line 1054
    invoke-direct {p0, v4}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->flush_block_only(Z)V

    .line 1055
    iget-object v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strm:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    iget v2, v2, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_out:I

    if-nez v2, :cond_0

    goto/16 :goto_0

    .line 1036
    :cond_7
    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->match_length:I

    add-int/2addr v2, v6

    iput v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    .line 1037
    iput v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->match_length:I

    .line 1038
    iget-object v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    aget-byte v2, v2, v6

    and-int/lit16 v2, v2, 0xff

    iput v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->ins_h:I

    .line 1040
    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->ins_h:I

    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->hash_shift:I

    shl-int/2addr v2, v6

    iget-object v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    iget v7, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    add-int/lit8 v7, v7, 0x1

    aget-byte v6, v6, v7

    and-int/lit16 v6, v6, 0xff

    xor-int/2addr v2, v6

    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->hash_mask:I

    and-int/2addr v2, v6

    iput v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->ins_h:I

    goto :goto_2

    .line 1048
    .end local v0    # "bflush":Z
    :cond_8
    iget-object v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    aget-byte v2, v2, v6

    and-int/lit16 v2, v2, 0xff

    invoke-direct {p0, v4, v2}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->_tr_tally(II)Z

    move-result v0

    .line 1049
    .restart local v0    # "bflush":Z
    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lookahead:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lookahead:I

    .line 1050
    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    goto :goto_2

    .end local v0    # "bflush":Z
    :cond_9
    move v2, v4

    .line 1061
    goto/16 :goto_1

    .line 1069
    :cond_a
    if-ne p1, v10, :cond_b

    move v3, v5

    :cond_b
    move v4, v3

    goto/16 :goto_0
.end method

.method private deflate_slow(I)I
    .locals 12
    .param p1, "flush"    # I

    .prologue
    const/4 v11, 0x4

    const/4 v6, 0x3

    const/4 v4, 0x1

    const/4 v7, 0x2

    const/4 v5, 0x0

    .line 1077
    const/4 v1, 0x0

    .line 1087
    .local v1, "hash_head":I
    :cond_0
    :goto_0
    iget v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lookahead:I

    const/16 v8, 0x106

    if-ge v3, v8, :cond_4

    .line 1088
    invoke-direct {p0}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->fill_window()V

    .line 1089
    iget v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lookahead:I

    const/16 v8, 0x106

    if-ge v3, v8, :cond_2

    if-nez p1, :cond_2

    .line 1213
    :cond_1
    :goto_1
    return v5

    .line 1092
    :cond_2
    iget v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lookahead:I

    if-nez v3, :cond_4

    .line 1199
    iget v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->match_available:I

    if-eqz v3, :cond_3

    .line 1200
    iget-object v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    iget v8, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    add-int/lit8 v8, v8, -0x1

    aget-byte v3, v3, v8

    and-int/lit16 v3, v3, 0xff

    invoke-direct {p0, v5, v3}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->_tr_tally(II)Z

    .line 1201
    iput v5, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->match_available:I

    .line 1203
    :cond_3
    if-ne p1, v11, :cond_e

    move v3, v4

    :goto_2
    invoke-direct {p0, v3}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->flush_block_only(Z)V

    .line 1205
    iget-object v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strm:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    iget v3, v3, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_out:I

    if-nez v3, :cond_f

    .line 1206
    if-ne p1, v11, :cond_1

    move v5, v7

    .line 1207
    goto :goto_1

    .line 1100
    :cond_4
    iget v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lookahead:I

    if-lt v3, v6, :cond_5

    .line 1101
    iget v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->ins_h:I

    iget v8, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->hash_shift:I

    shl-int/2addr v3, v8

    iget-object v8, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    iget v9, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    add-int/lit8 v9, v9, 0x3

    add-int/lit8 v9, v9, -0x1

    aget-byte v8, v8, v9

    and-int/lit16 v8, v8, 0xff

    xor-int/2addr v3, v8

    iget v8, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->hash_mask:I

    and-int/2addr v3, v8

    iput v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->ins_h:I

    .line 1104
    iget-object v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->head:[S

    iget v8, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->ins_h:I

    aget-short v3, v3, v8

    const v8, 0xffff

    and-int v1, v3, v8

    .line 1105
    iget-object v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->prev:[S

    iget v8, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    iget v9, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->w_mask:I

    and-int/2addr v8, v9

    iget-object v9, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->head:[S

    iget v10, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->ins_h:I

    aget-short v9, v9, v10

    aput-short v9, v3, v8

    .line 1106
    iget-object v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->head:[S

    iget v8, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->ins_h:I

    iget v9, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    int-to-short v9, v9

    aput-short v9, v3, v8

    .line 1110
    :cond_5
    iget v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->match_length:I

    iput v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->prev_length:I

    .line 1111
    iget v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->match_start:I

    iput v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->prev_match:I

    .line 1112
    iput v7, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->match_length:I

    .line 1114
    if-eqz v1, :cond_8

    iget v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->prev_length:I

    iget v8, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->max_lazy_match:I

    if-ge v3, v8, :cond_8

    iget v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    sub-int/2addr v3, v1

    const v8, 0xffff

    and-int/2addr v3, v8

    iget v8, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->w_size:I

    add-int/lit16 v8, v8, -0x106

    if-gt v3, v8, :cond_8

    .line 1120
    iget v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strategy:I

    if-eq v3, v7, :cond_6

    .line 1121
    invoke-direct {p0, v1}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->longest_match(I)I

    move-result v3

    iput v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->match_length:I

    .line 1125
    :cond_6
    iget v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->match_length:I

    const/4 v8, 0x5

    if-gt v3, v8, :cond_8

    iget v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strategy:I

    if-eq v3, v4, :cond_7

    iget v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->match_length:I

    if-ne v3, v6, :cond_8

    iget v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    iget v8, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->match_start:I

    sub-int/2addr v3, v8

    const/16 v8, 0x1000

    if-le v3, v8, :cond_8

    .line 1131
    :cond_7
    iput v7, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->match_length:I

    .line 1137
    :cond_8
    iget v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->prev_length:I

    if-lt v3, v6, :cond_b

    iget v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->match_length:I

    iget v8, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->prev_length:I

    if-gt v3, v8, :cond_b

    .line 1138
    iget v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    iget v8, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lookahead:I

    add-int/2addr v3, v8

    add-int/lit8 v2, v3, -0x3

    .line 1143
    .local v2, "max_insert":I
    iget v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    add-int/lit8 v3, v3, -0x1

    iget v8, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->prev_match:I

    sub-int/2addr v3, v8

    iget v8, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->prev_length:I

    add-int/lit8 v8, v8, -0x3

    invoke-direct {p0, v3, v8}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->_tr_tally(II)Z

    move-result v0

    .line 1150
    .local v0, "bflush":Z
    iget v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lookahead:I

    iget v8, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->prev_length:I

    add-int/lit8 v8, v8, -0x1

    sub-int/2addr v3, v8

    iput v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lookahead:I

    .line 1151
    iget v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->prev_length:I

    add-int/lit8 v3, v3, -0x2

    iput v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->prev_length:I

    .line 1153
    :cond_9
    iget v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    if-gt v3, v2, :cond_a

    .line 1154
    iget v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->ins_h:I

    iget v8, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->hash_shift:I

    shl-int/2addr v3, v8

    iget-object v8, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    iget v9, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    add-int/lit8 v9, v9, 0x3

    add-int/lit8 v9, v9, -0x1

    aget-byte v8, v8, v9

    and-int/lit16 v8, v8, 0xff

    xor-int/2addr v3, v8

    iget v8, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->hash_mask:I

    and-int/2addr v3, v8

    iput v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->ins_h:I

    .line 1158
    iget-object v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->head:[S

    iget v8, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->ins_h:I

    aget-short v3, v3, v8

    const v8, 0xffff

    and-int v1, v3, v8

    .line 1159
    iget-object v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->prev:[S

    iget v8, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    iget v9, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->w_mask:I

    and-int/2addr v8, v9

    iget-object v9, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->head:[S

    iget v10, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->ins_h:I

    aget-short v9, v9, v10

    aput-short v9, v3, v8

    .line 1160
    iget-object v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->head:[S

    iget v8, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->ins_h:I

    iget v9, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    int-to-short v9, v9

    aput-short v9, v3, v8

    .line 1162
    :cond_a
    iget v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->prev_length:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->prev_length:I

    if-nez v3, :cond_9

    .line 1163
    iput v5, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->match_available:I

    .line 1164
    iput v7, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->match_length:I

    .line 1165
    iget v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    .line 1167
    if-eqz v0, :cond_0

    .line 1168
    invoke-direct {p0, v5}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->flush_block_only(Z)V

    .line 1169
    iget-object v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strm:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    iget v3, v3, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_out:I

    if-nez v3, :cond_0

    goto/16 :goto_1

    .line 1173
    .end local v0    # "bflush":Z
    .end local v2    # "max_insert":I
    :cond_b
    iget v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->match_available:I

    if-eqz v3, :cond_d

    .line 1179
    iget-object v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    iget v8, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    add-int/lit8 v8, v8, -0x1

    aget-byte v3, v3, v8

    and-int/lit16 v3, v3, 0xff

    invoke-direct {p0, v5, v3}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->_tr_tally(II)Z

    move-result v0

    .line 1181
    .restart local v0    # "bflush":Z
    if-eqz v0, :cond_c

    .line 1182
    invoke-direct {p0, v5}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->flush_block_only(Z)V

    .line 1184
    :cond_c
    iget v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    .line 1185
    iget v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lookahead:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lookahead:I

    .line 1186
    iget-object v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strm:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    iget v3, v3, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_out:I

    if-nez v3, :cond_0

    goto/16 :goto_1

    .line 1193
    .end local v0    # "bflush":Z
    :cond_d
    iput v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->match_available:I

    .line 1194
    iget v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    .line 1195
    iget v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lookahead:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lookahead:I

    goto/16 :goto_0

    :cond_e
    move v3, v5

    .line 1203
    goto/16 :goto_2

    .line 1213
    :cond_f
    if-ne p1, v11, :cond_10

    move v4, v6

    :cond_10
    move v5, v4

    goto/16 :goto_1
.end method

.method private deflate_stored(I)I
    .locals 7
    .param p1, "flush"    # I

    .prologue
    const/4 v6, 0x4

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 741
    const v0, 0xffff

    .line 744
    .local v0, "max_block_size":I
    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->pending_buf_size:I

    add-int/lit8 v2, v2, -0x5

    if-le v0, v2, :cond_0

    .line 745
    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->pending_buf_size:I

    add-int/lit8 v0, v2, -0x5

    .line 751
    :cond_0
    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lookahead:I

    if-gt v2, v3, :cond_3

    .line 752
    invoke-direct {p0}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->fill_window()V

    .line 753
    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lookahead:I

    if-nez v2, :cond_2

    if-nez p1, :cond_2

    .line 793
    :cond_1
    :goto_0
    return v4

    .line 756
    :cond_2
    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lookahead:I

    if-nez v2, :cond_3

    .line 788
    if-ne p1, v6, :cond_6

    move v2, v3

    :goto_1
    invoke-direct {p0, v2}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->flush_block_only(Z)V

    .line 789
    iget-object v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strm:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    iget v2, v2, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_out:I

    if-nez v2, :cond_7

    .line 790
    if-ne p1, v6, :cond_1

    const/4 v4, 0x2

    goto :goto_0

    .line 761
    :cond_3
    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    iget v5, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lookahead:I

    add-int/2addr v2, v5

    iput v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    .line 762
    iput v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lookahead:I

    .line 765
    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->block_start:I

    add-int v1, v2, v0

    .line 766
    .local v1, "max_start":I
    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    if-eqz v2, :cond_4

    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    if-lt v2, v1, :cond_5

    .line 768
    :cond_4
    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    sub-int/2addr v2, v1

    iput v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lookahead:I

    .line 769
    iput v1, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    .line 771
    invoke-direct {p0, v4}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->flush_block_only(Z)V

    .line 772
    iget-object v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strm:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    iget v2, v2, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_out:I

    if-eqz v2, :cond_1

    .line 780
    :cond_5
    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    iget v5, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->block_start:I

    sub-int/2addr v2, v5

    iget v5, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->w_size:I

    add-int/lit16 v5, v5, -0x106

    if-lt v2, v5, :cond_0

    .line 781
    invoke-direct {p0, v4}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->flush_block_only(Z)V

    .line 782
    iget-object v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strm:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    iget v2, v2, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_out:I

    if-nez v2, :cond_0

    goto :goto_0

    .end local v1    # "max_start":I
    :cond_6
    move v2, v4

    .line 788
    goto :goto_1

    .line 793
    :cond_7
    if-ne p1, v6, :cond_8

    const/4 v3, 0x3

    :cond_8
    move v4, v3

    goto :goto_0
.end method

.method private fill_window()V
    .locals 10

    .prologue
    const v9, 0xffff

    const/4 v5, 0x0

    .line 887
    :cond_0
    iget v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window_size:I

    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lookahead:I

    sub-int/2addr v4, v6

    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    sub-int v1, v4, v6

    .line 890
    .local v1, "more":I
    if-nez v1, :cond_3

    iget v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    if-nez v4, :cond_3

    iget v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lookahead:I

    if-nez v4, :cond_3

    .line 891
    iget v1, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->w_size:I

    .line 929
    :cond_1
    :goto_0
    iget-object v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strm:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    iget v4, v4, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    if-nez v4, :cond_9

    .line 956
    :cond_2
    :goto_1
    return-void

    .line 892
    :cond_3
    const/4 v4, -0x1

    if-ne v1, v4, :cond_4

    .line 895
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 899
    :cond_4
    iget v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->w_size:I

    iget v7, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->w_size:I

    add-int/2addr v6, v7

    add-int/lit16 v6, v6, -0x106

    if-lt v4, v6, :cond_1

    .line 900
    iget-object v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->w_size:I

    iget-object v7, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    iget v8, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->w_size:I

    invoke-static {v4, v6, v7, v5, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 901
    iget v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->match_start:I

    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->w_size:I

    sub-int/2addr v4, v6

    iput v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->match_start:I

    .line 902
    iget v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->w_size:I

    sub-int/2addr v4, v6

    iput v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    .line 903
    iget v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->block_start:I

    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->w_size:I

    sub-int/2addr v4, v6

    iput v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->block_start:I

    .line 911
    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->hash_size:I

    .line 912
    .local v2, "n":I
    move v3, v2

    .line 914
    .local v3, "p":I
    :cond_5
    iget-object v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->head:[S

    add-int/lit8 v3, v3, -0x1

    aget-short v4, v4, v3

    and-int v0, v4, v9

    .line 915
    .local v0, "m":I
    iget-object v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->head:[S

    iget v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->w_size:I

    if-lt v0, v4, :cond_7

    iget v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->w_size:I

    sub-int v4, v0, v4

    int-to-short v4, v4

    :goto_2
    aput-short v4, v6, v3

    .line 916
    add-int/lit8 v2, v2, -0x1

    if-nez v2, :cond_5

    .line 918
    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->w_size:I

    .line 919
    move v3, v2

    .line 921
    :cond_6
    iget-object v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->prev:[S

    add-int/lit8 v3, v3, -0x1

    aget-short v4, v4, v3

    and-int v0, v4, v9

    .line 922
    iget-object v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->prev:[S

    iget v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->w_size:I

    if-lt v0, v4, :cond_8

    iget v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->w_size:I

    sub-int v4, v0, v4

    int-to-short v4, v4

    :goto_3
    aput-short v4, v6, v3

    .line 925
    add-int/lit8 v2, v2, -0x1

    if-nez v2, :cond_6

    .line 926
    iget v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->w_size:I

    add-int/2addr v1, v4

    goto :goto_0

    :cond_7
    move v4, v5

    .line 915
    goto :goto_2

    :cond_8
    move v4, v5

    .line 922
    goto :goto_3

    .line 944
    .end local v0    # "m":I
    .end local v2    # "n":I
    .end local v3    # "p":I
    :cond_9
    iget-object v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strm:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    iget-object v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    iget v7, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    iget v8, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lookahead:I

    add-int/2addr v7, v8

    invoke-virtual {v4, v6, v7, v1}, Lorg/jboss/netty/util/internal/jzlib/ZStream;->read_buf([BII)I

    move-result v2

    .line 945
    .restart local v2    # "n":I
    iget v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lookahead:I

    add-int/2addr v4, v2

    iput v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lookahead:I

    .line 948
    iget v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lookahead:I

    const/4 v6, 0x3

    if-lt v4, v6, :cond_a

    .line 949
    iget-object v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    aget-byte v4, v4, v6

    and-int/lit16 v4, v4, 0xff

    iput v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->ins_h:I

    .line 950
    iget v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->ins_h:I

    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->hash_shift:I

    shl-int/2addr v4, v6

    iget-object v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    iget v7, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    add-int/lit8 v7, v7, 0x1

    aget-byte v6, v6, v7

    and-int/lit16 v6, v6, 0xff

    xor-int/2addr v4, v6

    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->hash_mask:I

    and-int/2addr v4, v6

    iput v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->ins_h:I

    .line 955
    :cond_a
    iget v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lookahead:I

    const/16 v6, 0x106

    if-ge v4, v6, :cond_2

    iget-object v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strm:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    iget v4, v4, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    if-nez v4, :cond_0

    goto/16 :goto_1
.end method

.method private flush_block_only(Z)V
    .locals 3
    .param p1, "eof"    # Z

    .prologue
    .line 724
    iget v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->block_start:I

    if-ltz v0, :cond_0

    iget v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->block_start:I

    :goto_0
    iget v1, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->block_start:I

    sub-int/2addr v1, v2

    invoke-direct {p0, v0, v1, p1}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->_tr_flush_block(IIZ)V

    .line 726
    iget v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    iput v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->block_start:I

    .line 727
    iget-object v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strm:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/jzlib/ZStream;->flush_pending()V

    .line 728
    return-void

    .line 724
    :cond_0
    const/4 v0, -0x1

    goto :goto_0
.end method

.method private init_block()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 294
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/16 v1, 0x11e

    if-ge v0, v1, :cond_0

    .line 295
    iget-object v1, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->dyn_ltree:[S

    mul-int/lit8 v2, v0, 0x2

    aput-short v4, v1, v2

    .line 294
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 297
    :cond_0
    const/4 v0, 0x0

    :goto_1
    const/16 v1, 0x1e

    if-ge v0, v1, :cond_1

    .line 298
    iget-object v1, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->dyn_dtree:[S

    mul-int/lit8 v2, v0, 0x2

    aput-short v4, v1, v2

    .line 297
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 300
    :cond_1
    const/4 v0, 0x0

    :goto_2
    const/16 v1, 0x13

    if-ge v0, v1, :cond_2

    .line 301
    iget-object v1, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bl_tree:[S

    mul-int/lit8 v2, v0, 0x2

    aput-short v4, v1, v2

    .line 300
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 304
    :cond_2
    iget-object v1, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->dyn_ltree:[S

    const/16 v2, 0x200

    const/4 v3, 0x1

    aput-short v3, v1, v2

    .line 305
    iput v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->static_len:I

    iput v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->opt_len:I

    .line 306
    iput v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->matches:I

    iput v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->last_lit:I

    .line 307
    return-void
.end method

.method private lm_init()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 256
    iget v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->w_size:I

    mul-int/lit8 v0, v0, 0x2

    iput v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window_size:I

    .line 259
    sget-object v0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->config_table:[Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;

    iget v1, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->level:I

    aget-object v0, v0, v1

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;->max_lazy:I

    iput v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->max_lazy_match:I

    .line 260
    sget-object v0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->config_table:[Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;

    iget v1, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->level:I

    aget-object v0, v0, v1

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;->good_length:I

    iput v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->good_match:I

    .line 261
    sget-object v0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->config_table:[Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;

    iget v1, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->level:I

    aget-object v0, v0, v1

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;->nice_length:I

    iput v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->nice_match:I

    .line 262
    sget-object v0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->config_table:[Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;

    iget v1, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->level:I

    aget-object v0, v0, v1

    iget v0, v0, Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;->max_chain:I

    iput v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->max_chain_length:I

    .line 264
    iput v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    .line 265
    iput v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->block_start:I

    .line 266
    iput v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lookahead:I

    .line 267
    const/4 v0, 0x2

    iput v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->prev_length:I

    iput v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->match_length:I

    .line 268
    iput v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->match_available:I

    .line 269
    iput v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->ins_h:I

    .line 270
    return-void
.end method

.method private longest_match(I)I
    .locals 14
    .param p1, "cur_match"    # I

    .prologue
    .line 1217
    iget v1, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->max_chain_length:I

    .line 1218
    .local v1, "chain_length":I
    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    .line 1221
    .local v6, "scan":I
    iget v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->prev_length:I

    .line 1222
    .local v0, "best_len":I
    iget v11, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    iget v12, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->w_size:I

    add-int/lit16 v12, v12, -0x106

    if-le v11, v12, :cond_4

    iget v11, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    iget v12, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->w_size:I

    add-int/lit16 v12, v12, -0x106

    sub-int v3, v11, v12

    .line 1224
    .local v3, "limit":I
    :goto_0
    iget v5, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->nice_match:I

    .line 1229
    .local v5, "nice_match":I
    iget v10, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->w_mask:I

    .line 1231
    .local v10, "wmask":I
    iget v11, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    add-int/lit16 v9, v11, 0x102

    .line 1232
    .local v9, "strend":I
    iget-object v11, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    add-int v12, v6, v0

    add-int/lit8 v12, v12, -0x1

    aget-byte v8, v11, v12

    .line 1233
    .local v8, "scan_end1":B
    iget-object v11, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    add-int v12, v6, v0

    aget-byte v7, v11, v12

    .line 1239
    .local v7, "scan_end":B
    iget v11, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->prev_length:I

    iget v12, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->good_match:I

    if-lt v11, v12, :cond_0

    .line 1240
    shr-int/lit8 v1, v1, 0x2

    .line 1245
    :cond_0
    iget v11, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lookahead:I

    if-le v5, v11, :cond_1

    .line 1246
    iget v5, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lookahead:I

    .line 1250
    :cond_1
    move v4, p1

    .line 1254
    .local v4, "match":I
    iget-object v11, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    add-int v12, v4, v0

    aget-byte v11, v11, v12

    if-ne v11, v7, :cond_2

    iget-object v11, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    add-int v12, v4, v0

    add-int/lit8 v12, v12, -0x1

    aget-byte v11, v11, v12

    if-ne v11, v8, :cond_2

    iget-object v11, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    aget-byte v11, v11, v4

    iget-object v12, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    aget-byte v12, v12, v6

    if-ne v11, v12, :cond_2

    iget-object v11, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    add-int/lit8 v4, v4, 0x1

    aget-byte v11, v11, v4

    iget-object v12, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    add-int/lit8 v13, v6, 0x1

    aget-byte v12, v12, v13

    if-eq v11, v12, :cond_5

    .line 1295
    :cond_2
    :goto_1
    iget-object v11, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->prev:[S

    and-int v12, p1, v10

    aget-short v11, v11, v12

    const v12, 0xffff

    and-int p1, v11, v12

    if-le p1, v3, :cond_3

    add-int/lit8 v1, v1, -0x1

    if-nez v1, :cond_1

    .line 1298
    :cond_3
    iget v11, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lookahead:I

    if-gt v0, v11, :cond_8

    .line 1301
    .end local v0    # "best_len":I
    :goto_2
    return v0

    .line 1222
    .end local v3    # "limit":I
    .end local v4    # "match":I
    .end local v5    # "nice_match":I
    .end local v7    # "scan_end":B
    .end local v8    # "scan_end1":B
    .end local v9    # "strend":I
    .end local v10    # "wmask":I
    .restart local v0    # "best_len":I
    :cond_4
    const/4 v3, 0x0

    goto :goto_0

    .line 1266
    .restart local v3    # "limit":I
    .restart local v4    # "match":I
    .restart local v5    # "nice_match":I
    .restart local v7    # "scan_end":B
    .restart local v8    # "scan_end1":B
    .restart local v9    # "strend":I
    .restart local v10    # "wmask":I
    :cond_5
    add-int/lit8 v6, v6, 0x2

    .line 1267
    add-int/lit8 v4, v4, 0x1

    .line 1278
    :cond_6
    iget-object v11, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    add-int/lit8 v6, v6, 0x1

    aget-byte v11, v11, v6

    iget-object v12, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    add-int/lit8 v4, v4, 0x1

    aget-byte v12, v12, v4

    if-ne v11, v12, :cond_7

    iget-object v11, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    add-int/lit8 v6, v6, 0x1

    aget-byte v11, v11, v6

    iget-object v12, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    add-int/lit8 v4, v4, 0x1

    aget-byte v12, v12, v4

    if-ne v11, v12, :cond_7

    iget-object v11, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    add-int/lit8 v6, v6, 0x1

    aget-byte v11, v11, v6

    iget-object v12, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    add-int/lit8 v4, v4, 0x1

    aget-byte v12, v12, v4

    if-ne v11, v12, :cond_7

    iget-object v11, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    add-int/lit8 v6, v6, 0x1

    aget-byte v11, v11, v6

    iget-object v12, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    add-int/lit8 v4, v4, 0x1

    aget-byte v12, v12, v4

    if-ne v11, v12, :cond_7

    iget-object v11, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    add-int/lit8 v6, v6, 0x1

    aget-byte v11, v11, v6

    iget-object v12, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    add-int/lit8 v4, v4, 0x1

    aget-byte v12, v12, v4

    if-ne v11, v12, :cond_7

    iget-object v11, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    add-int/lit8 v6, v6, 0x1

    aget-byte v11, v11, v6

    iget-object v12, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    add-int/lit8 v4, v4, 0x1

    aget-byte v12, v12, v4

    if-ne v11, v12, :cond_7

    iget-object v11, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    add-int/lit8 v6, v6, 0x1

    aget-byte v11, v11, v6

    iget-object v12, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    add-int/lit8 v4, v4, 0x1

    aget-byte v12, v12, v4

    if-ne v11, v12, :cond_7

    iget-object v11, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    add-int/lit8 v6, v6, 0x1

    aget-byte v11, v11, v6

    iget-object v12, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    add-int/lit8 v4, v4, 0x1

    aget-byte v12, v12, v4

    if-ne v11, v12, :cond_7

    if-lt v6, v9, :cond_6

    .line 1282
    :cond_7
    sub-int v11, v9, v6

    rsub-int v2, v11, 0x102

    .line 1283
    .local v2, "len":I
    add-int/lit16 v6, v9, -0x102

    .line 1285
    if-le v2, v0, :cond_2

    .line 1286
    iput p1, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->match_start:I

    .line 1287
    move v0, v2

    .line 1288
    if-ge v2, v5, :cond_3

    .line 1291
    iget-object v11, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    add-int v12, v6, v0

    add-int/lit8 v12, v12, -0x1

    aget-byte v8, v11, v12

    .line 1292
    iget-object v11, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    add-int v12, v6, v0

    aget-byte v7, v11, v12

    goto/16 :goto_1

    .line 1301
    .end local v2    # "len":I
    :cond_8
    iget v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lookahead:I

    goto/16 :goto_2
.end method

.method private putShortMSB(I)V
    .locals 1
    .param p1, "b"    # I

    .prologue
    .line 513
    shr-int/lit8 v0, p1, 0x8

    int-to-byte v0, v0

    invoke-direct {p0, v0}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->put_byte(B)V

    .line 514
    int-to-byte v0, p1

    invoke-direct {p0, v0}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->put_byte(B)V

    .line 515
    return-void
.end method

.method private put_byte(B)V
    .locals 3
    .param p1, "c"    # B

    .prologue
    .line 504
    iget-object v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->pending_buf:[B

    iget v1, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->pending:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->pending:I

    aput-byte p1, v0, v1

    .line 505
    return-void
.end method

.method private put_byte([BII)V
    .locals 2
    .param p1, "p"    # [B
    .param p2, "start"    # I
    .param p3, "len"    # I

    .prologue
    .line 499
    iget-object v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->pending_buf:[B

    iget v1, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->pending:I

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 500
    iget v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->pending:I

    add-int/2addr v0, p3

    iput v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->pending:I

    .line 501
    return-void
.end method

.method private put_short(I)V
    .locals 1
    .param p1, "w"    # I

    .prologue
    .line 508
    int-to-byte v0, p1

    invoke-direct {p0, v0}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->put_byte(B)V

    .line 509
    ushr-int/lit8 v0, p1, 0x8

    int-to-byte v0, v0

    invoke-direct {p0, v0}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->put_byte(B)V

    .line 510
    return-void
.end method

.method private scan_tree([SI)V
    .locals 10
    .param p1, "tree"    # [S
    .param p2, "max_code"    # I

    .prologue
    .line 349
    const/4 v6, -0x1

    .line 351
    .local v6, "prevlen":I
    const/4 v7, 0x1

    aget-short v5, p1, v7

    .line 352
    .local v5, "nextlen":I
    const/4 v0, 0x0

    .line 353
    .local v0, "count":I
    const/4 v2, 0x7

    .line 354
    .local v2, "max_count":I
    const/4 v3, 0x4

    .line 356
    .local v3, "min_count":I
    if-nez v5, :cond_0

    .line 357
    const/16 v2, 0x8a

    .line 358
    const/4 v3, 0x3

    .line 360
    :cond_0
    add-int/lit8 v7, p2, 0x1

    mul-int/lit8 v7, v7, 0x2

    add-int/lit8 v7, v7, 0x1

    const/4 v8, -0x1

    aput-short v8, p1, v7

    .line 362
    const/4 v4, 0x0

    .local v4, "n":I
    :goto_0
    if-gt v4, p2, :cond_8

    .line 363
    move v1, v5

    .line 364
    .local v1, "curlen":I
    add-int/lit8 v7, v4, 0x1

    mul-int/lit8 v7, v7, 0x2

    add-int/lit8 v7, v7, 0x1

    aget-short v5, p1, v7

    .line 365
    add-int/lit8 v0, v0, 0x1

    if-ge v0, v2, :cond_1

    if-ne v1, v5, :cond_1

    .line 362
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 368
    :cond_1
    if-ge v0, v3, :cond_2

    .line 369
    iget-object v7, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bl_tree:[S

    mul-int/lit8 v8, v1, 0x2

    aget-short v9, v7, v8

    add-int/2addr v9, v0

    int-to-short v9, v9

    aput-short v9, v7, v8

    .line 380
    :goto_2
    const/4 v0, 0x0

    .line 381
    move v6, v1

    .line 382
    if-nez v5, :cond_6

    .line 383
    const/16 v2, 0x8a

    .line 384
    const/4 v3, 0x3

    goto :goto_1

    .line 370
    :cond_2
    if-eqz v1, :cond_4

    .line 371
    if-eq v1, v6, :cond_3

    .line 372
    iget-object v7, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bl_tree:[S

    mul-int/lit8 v8, v1, 0x2

    aget-short v9, v7, v8

    add-int/lit8 v9, v9, 0x1

    int-to-short v9, v9

    aput-short v9, v7, v8

    .line 374
    :cond_3
    iget-object v7, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bl_tree:[S

    const/16 v8, 0x20

    aget-short v9, v7, v8

    add-int/lit8 v9, v9, 0x1

    int-to-short v9, v9

    aput-short v9, v7, v8

    goto :goto_2

    .line 375
    :cond_4
    const/16 v7, 0xa

    if-gt v0, v7, :cond_5

    .line 376
    iget-object v7, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bl_tree:[S

    const/16 v8, 0x22

    aget-short v9, v7, v8

    add-int/lit8 v9, v9, 0x1

    int-to-short v9, v9

    aput-short v9, v7, v8

    goto :goto_2

    .line 378
    :cond_5
    iget-object v7, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bl_tree:[S

    const/16 v8, 0x24

    aget-short v9, v7, v8

    add-int/lit8 v9, v9, 0x1

    int-to-short v9, v9

    aput-short v9, v7, v8

    goto :goto_2

    .line 385
    :cond_6
    if-ne v1, v5, :cond_7

    .line 386
    const/4 v2, 0x6

    .line 387
    const/4 v3, 0x3

    goto :goto_1

    .line 389
    :cond_7
    const/4 v2, 0x7

    .line 390
    const/4 v3, 0x4

    goto :goto_1

    .line 393
    .end local v1    # "curlen":I
    :cond_8
    return-void
.end method

.method private send_all_trees(III)V
    .locals 3
    .param p1, "lcodes"    # I
    .param p2, "dcodes"    # I
    .param p3, "blcodes"    # I

    .prologue
    const/4 v2, 0x5

    .line 429
    add-int/lit16 v1, p1, -0x101

    invoke-direct {p0, v1, v2}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->send_bits(II)V

    .line 430
    add-int/lit8 v1, p2, -0x1

    invoke-direct {p0, v1, v2}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->send_bits(II)V

    .line 431
    add-int/lit8 v1, p3, -0x4

    const/4 v2, 0x4

    invoke-direct {p0, v1, v2}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->send_bits(II)V

    .line 432
    const/4 v0, 0x0

    .local v0, "rank":I
    :goto_0
    if-ge v0, p3, :cond_0

    .line 433
    iget-object v1, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bl_tree:[S

    sget-object v2, Lorg/jboss/netty/util/internal/jzlib/Tree;->bl_order:[B

    aget-byte v2, v2, v0

    mul-int/lit8 v2, v2, 0x2

    add-int/lit8 v2, v2, 0x1

    aget-short v1, v1, v2

    const/4 v2, 0x3

    invoke-direct {p0, v1, v2}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->send_bits(II)V

    .line 432
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 435
    :cond_0
    iget-object v1, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->dyn_ltree:[S

    add-int/lit8 v2, p1, -0x1

    invoke-direct {p0, v1, v2}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->send_tree([SI)V

    .line 436
    iget-object v1, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->dyn_dtree:[S

    add-int/lit8 v2, p2, -0x1

    invoke-direct {p0, v1, v2}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->send_tree([SI)V

    .line 437
    return-void
.end method

.method private send_bits(II)V
    .locals 5
    .param p1, "value"    # I
    .param p2, "length"    # I

    .prologue
    const v4, 0xffff

    .line 523
    move v0, p2

    .line 524
    .local v0, "len":I
    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bi_valid:I

    rsub-int/lit8 v3, v0, 0x10

    if-le v2, v3, :cond_0

    .line 525
    move v1, p1

    .line 527
    .local v1, "val":I
    iget-short v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bi_buf:S

    iget v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bi_valid:I

    shl-int v3, v1, v3

    and-int/2addr v3, v4

    or-int/2addr v2, v3

    int-to-short v2, v2

    iput-short v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bi_buf:S

    .line 528
    iget-short v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bi_buf:S

    invoke-direct {p0, v2}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->put_short(I)V

    .line 529
    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bi_valid:I

    rsub-int/lit8 v2, v2, 0x10

    ushr-int v2, v1, v2

    int-to-short v2, v2

    iput-short v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bi_buf:S

    .line 530
    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bi_valid:I

    add-int/lit8 v3, v0, -0x10

    add-int/2addr v2, v3

    iput v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bi_valid:I

    .line 536
    .end local v1    # "val":I
    :goto_0
    return-void

    .line 533
    :cond_0
    iget-short v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bi_buf:S

    iget v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bi_valid:I

    shl-int v3, p1, v3

    and-int/2addr v3, v4

    or-int/2addr v2, v3

    int-to-short v2, v2

    iput-short v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bi_buf:S

    .line 534
    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bi_valid:I

    add-int/2addr v2, v0

    iput v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bi_valid:I

    goto :goto_0
.end method

.method private send_code(I[S)V
    .locals 4
    .param p1, "c"    # I
    .param p2, "tree"    # [S

    .prologue
    const v3, 0xffff

    .line 518
    mul-int/lit8 v0, p1, 0x2

    .line 519
    .local v0, "c2":I
    aget-short v1, p2, v0

    and-int/2addr v1, v3

    add-int/lit8 v2, v0, 0x1

    aget-short v2, p2, v2

    and-int/2addr v2, v3

    invoke-direct {p0, v1, v2}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->send_bits(II)V

    .line 520
    return-void
.end method

.method private send_tree([SI)V
    .locals 9
    .param p1, "tree"    # [S
    .param p2, "max_code"    # I

    .prologue
    .line 445
    const/4 v6, -0x1

    .line 447
    .local v6, "prevlen":I
    const/4 v7, 0x1

    aget-short v5, p1, v7

    .line 448
    .local v5, "nextlen":I
    const/4 v0, 0x0

    .line 449
    .local v0, "count":I
    const/4 v2, 0x7

    .line 450
    .local v2, "max_count":I
    const/4 v3, 0x4

    .line 452
    .local v3, "min_count":I
    if-nez v5, :cond_0

    .line 453
    const/16 v2, 0x8a

    .line 454
    const/4 v3, 0x3

    .line 457
    :cond_0
    const/4 v4, 0x0

    .local v4, "n":I
    :goto_0
    if-gt v4, p2, :cond_9

    .line 458
    move v1, v5

    .line 459
    .local v1, "curlen":I
    add-int/lit8 v7, v4, 0x1

    mul-int/lit8 v7, v7, 0x2

    add-int/lit8 v7, v7, 0x1

    aget-short v5, p1, v7

    .line 460
    add-int/lit8 v0, v0, 0x1

    if-ge v0, v2, :cond_1

    if-ne v1, v5, :cond_1

    .line 457
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 463
    :cond_1
    if-ge v0, v3, :cond_3

    .line 465
    :cond_2
    iget-object v7, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bl_tree:[S

    invoke-direct {p0, v1, v7}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->send_code(I[S)V

    .line 466
    add-int/lit8 v0, v0, -0x1

    if-nez v0, :cond_2

    .line 481
    :goto_2
    const/4 v0, 0x0

    .line 482
    move v6, v1

    .line 483
    if-nez v5, :cond_7

    .line 484
    const/16 v2, 0x8a

    .line 485
    const/4 v3, 0x3

    goto :goto_1

    .line 467
    :cond_3
    if-eqz v1, :cond_5

    .line 468
    if-eq v1, v6, :cond_4

    .line 469
    iget-object v7, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bl_tree:[S

    invoke-direct {p0, v1, v7}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->send_code(I[S)V

    .line 470
    add-int/lit8 v0, v0, -0x1

    .line 472
    :cond_4
    const/16 v7, 0x10

    iget-object v8, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bl_tree:[S

    invoke-direct {p0, v7, v8}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->send_code(I[S)V

    .line 473
    add-int/lit8 v7, v0, -0x3

    const/4 v8, 0x2

    invoke-direct {p0, v7, v8}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->send_bits(II)V

    goto :goto_2

    .line 474
    :cond_5
    const/16 v7, 0xa

    if-gt v0, v7, :cond_6

    .line 475
    const/16 v7, 0x11

    iget-object v8, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bl_tree:[S

    invoke-direct {p0, v7, v8}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->send_code(I[S)V

    .line 476
    add-int/lit8 v7, v0, -0x3

    const/4 v8, 0x3

    invoke-direct {p0, v7, v8}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->send_bits(II)V

    goto :goto_2

    .line 478
    :cond_6
    const/16 v7, 0x12

    iget-object v8, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bl_tree:[S

    invoke-direct {p0, v7, v8}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->send_code(I[S)V

    .line 479
    add-int/lit8 v7, v0, -0xb

    const/4 v8, 0x7

    invoke-direct {p0, v7, v8}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->send_bits(II)V

    goto :goto_2

    .line 486
    :cond_7
    if-ne v1, v5, :cond_8

    .line 487
    const/4 v2, 0x6

    .line 488
    const/4 v3, 0x3

    goto :goto_1

    .line 490
    :cond_8
    const/4 v2, 0x7

    .line 491
    const/4 v3, 0x4

    goto :goto_1

    .line 494
    .end local v1    # "curlen":I
    :cond_9
    return-void
.end method

.method private set_data_type()V
    .locals 5

    .prologue
    .line 660
    const/4 v2, 0x0

    .line 661
    .local v2, "n":I
    const/4 v0, 0x0

    .line 662
    .local v0, "ascii_freq":I
    const/4 v1, 0x0

    .line 663
    .local v1, "bin_freq":I
    :goto_0
    const/4 v3, 0x7

    if-ge v2, v3, :cond_0

    .line 664
    iget-object v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->dyn_ltree:[S

    mul-int/lit8 v4, v2, 0x2

    aget-short v3, v3, v4

    add-int/2addr v1, v3

    .line 665
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 667
    :cond_0
    :goto_1
    const/16 v3, 0x80

    if-ge v2, v3, :cond_1

    .line 668
    iget-object v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->dyn_ltree:[S

    mul-int/lit8 v4, v2, 0x2

    aget-short v3, v3, v4

    add-int/2addr v0, v3

    .line 669
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 671
    :cond_1
    :goto_2
    const/16 v3, 0x100

    if-ge v2, v3, :cond_2

    .line 672
    iget-object v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->dyn_ltree:[S

    mul-int/lit8 v4, v2, 0x2

    aget-short v3, v3, v4

    add-int/2addr v1, v3

    .line 673
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 675
    :cond_2
    ushr-int/lit8 v3, v0, 0x2

    if-le v1, v3, :cond_3

    const/4 v3, 0x0

    :goto_3
    int-to-byte v3, v3

    iput-byte v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->data_type:B

    .line 676
    return-void

    .line 675
    :cond_3
    const/4 v3, 0x1

    goto :goto_3
.end method

.method private static smaller([SII[B)Z
    .locals 4
    .param p0, "tree"    # [S
    .param p1, "n"    # I
    .param p2, "m"    # I
    .param p3, "depth"    # [B

    .prologue
    .line 338
    mul-int/lit8 v2, p1, 0x2

    aget-short v1, p0, v2

    .line 339
    .local v1, "tn2":S
    mul-int/lit8 v2, p2, 0x2

    aget-short v0, p0, v2

    .line 340
    .local v0, "tm2":S
    if-lt v1, v0, :cond_0

    if-ne v1, v0, :cond_1

    aget-byte v2, p3, p1

    aget-byte v3, p3, p2

    if-gt v2, v3, :cond_1

    :cond_0
    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private tr_init()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 275
    iget-object v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->l_desc:Lorg/jboss/netty/util/internal/jzlib/Tree;

    iget-object v1, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->dyn_ltree:[S

    iput-object v1, v0, Lorg/jboss/netty/util/internal/jzlib/Tree;->dyn_tree:[S

    .line 276
    iget-object v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->l_desc:Lorg/jboss/netty/util/internal/jzlib/Tree;

    sget-object v1, Lorg/jboss/netty/util/internal/jzlib/StaticTree;->static_l_desc:Lorg/jboss/netty/util/internal/jzlib/StaticTree;

    iput-object v1, v0, Lorg/jboss/netty/util/internal/jzlib/Tree;->stat_desc:Lorg/jboss/netty/util/internal/jzlib/StaticTree;

    .line 278
    iget-object v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->d_desc:Lorg/jboss/netty/util/internal/jzlib/Tree;

    iget-object v1, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->dyn_dtree:[S

    iput-object v1, v0, Lorg/jboss/netty/util/internal/jzlib/Tree;->dyn_tree:[S

    .line 279
    iget-object v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->d_desc:Lorg/jboss/netty/util/internal/jzlib/Tree;

    sget-object v1, Lorg/jboss/netty/util/internal/jzlib/StaticTree;->static_d_desc:Lorg/jboss/netty/util/internal/jzlib/StaticTree;

    iput-object v1, v0, Lorg/jboss/netty/util/internal/jzlib/Tree;->stat_desc:Lorg/jboss/netty/util/internal/jzlib/StaticTree;

    .line 281
    iget-object v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bl_desc:Lorg/jboss/netty/util/internal/jzlib/Tree;

    iget-object v1, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bl_tree:[S

    iput-object v1, v0, Lorg/jboss/netty/util/internal/jzlib/Tree;->dyn_tree:[S

    .line 282
    iget-object v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bl_desc:Lorg/jboss/netty/util/internal/jzlib/Tree;

    sget-object v1, Lorg/jboss/netty/util/internal/jzlib/StaticTree;->static_bl_desc:Lorg/jboss/netty/util/internal/jzlib/StaticTree;

    iput-object v1, v0, Lorg/jboss/netty/util/internal/jzlib/Tree;->stat_desc:Lorg/jboss/netty/util/internal/jzlib/StaticTree;

    .line 284
    iput-short v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bi_buf:S

    .line 285
    iput v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->bi_valid:I

    .line 286
    const/16 v0, 0x8

    iput v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->last_eob_len:I

    .line 289
    invoke-direct {p0}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->init_block()V

    .line 290
    return-void
.end method


# virtual methods
.method deflate(Lorg/jboss/netty/util/internal/jzlib/ZStream;I)I
    .locals 11
    .param p1, "strm"    # Lorg/jboss/netty/util/internal/jzlib/ZStream;
    .param p2, "flush"    # I

    .prologue
    .line 1479
    const/4 v6, 0x4

    if-gt p2, v6, :cond_0

    if-gez p2, :cond_1

    .line 1480
    :cond_0
    const/4 v6, -0x2

    .line 1678
    :goto_0
    return v6

    .line 1483
    :cond_1
    iget-object v6, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_out:[B

    if-eqz v6, :cond_3

    iget-object v6, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in:[B

    if-nez v6, :cond_2

    iget v6, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    if-nez v6, :cond_3

    :cond_2
    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->status:I

    const/16 v7, 0x29a

    if-ne v6, v7, :cond_4

    const/4 v6, 0x4

    if-eq p2, v6, :cond_4

    .line 1486
    :cond_3
    sget-object v6, Lorg/jboss/netty/util/internal/jzlib/Deflate;->z_errmsg:[Ljava/lang/String;

    const/4 v7, 0x4

    aget-object v6, v6, v7

    iput-object v6, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->msg:Ljava/lang/String;

    .line 1487
    const/4 v6, -0x2

    goto :goto_0

    .line 1489
    :cond_4
    iget v6, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_out:I

    if-nez v6, :cond_5

    .line 1490
    sget-object v6, Lorg/jboss/netty/util/internal/jzlib/Deflate;->z_errmsg:[Ljava/lang/String;

    const/4 v7, 0x7

    aget-object v6, v6, v7

    iput-object v6, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->msg:Ljava/lang/String;

    .line 1491
    const/4 v6, -0x5

    goto :goto_0

    .line 1494
    :cond_5
    iput-object p1, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strm:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    .line 1495
    iget v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->last_flush:I

    .line 1496
    .local v4, "old_flush":I
    iput p2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->last_flush:I

    .line 1499
    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->status:I

    const/16 v7, 0x2a

    if-ne v6, v7, :cond_6

    .line 1500
    sget-object v6, Lorg/jboss/netty/util/internal/jzlib/Deflate$1;->$SwitchMap$org$jboss$netty$util$internal$jzlib$JZlib$WrapperType:[I

    iget-object v7, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->wrapperType:Lorg/jboss/netty/util/internal/jzlib/JZlib$WrapperType;

    invoke-virtual {v7}, Lorg/jboss/netty/util/internal/jzlib/JZlib$WrapperType;->ordinal()I

    move-result v7

    aget v6, v6, v7

    packed-switch v6, :pswitch_data_0

    .line 1555
    :goto_1
    const/16 v6, 0x71

    iput v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->status:I

    .line 1559
    :cond_6
    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->pending:I

    if-eqz v6, :cond_a

    .line 1560
    invoke-virtual {p1}, Lorg/jboss/netty/util/internal/jzlib/ZStream;->flush_pending()V

    .line 1561
    iget v6, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_out:I

    if-nez v6, :cond_b

    .line 1568
    const/4 v6, -0x1

    iput v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->last_flush:I

    .line 1569
    const/4 v6, 0x0

    goto :goto_0

    .line 1502
    :pswitch_0
    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->w_bits:I

    add-int/lit8 v6, v6, -0x8

    shl-int/lit8 v6, v6, 0x4

    add-int/lit8 v6, v6, 0x8

    shl-int/lit8 v1, v6, 0x8

    .line 1503
    .local v1, "header":I
    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->level:I

    add-int/lit8 v6, v6, -0x1

    and-int/lit16 v6, v6, 0xff

    shr-int/lit8 v3, v6, 0x1

    .line 1505
    .local v3, "level_flags":I
    const/4 v6, 0x3

    if-le v3, v6, :cond_7

    .line 1506
    const/4 v3, 0x3

    .line 1508
    :cond_7
    shl-int/lit8 v6, v3, 0x6

    or-int/2addr v1, v6

    .line 1509
    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    if-eqz v6, :cond_8

    .line 1510
    or-int/lit8 v1, v1, 0x20

    .line 1512
    :cond_8
    rem-int/lit8 v6, v1, 0x1f

    rsub-int/lit8 v6, v6, 0x1f

    add-int/2addr v1, v6

    .line 1514
    invoke-direct {p0, v1}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->putShortMSB(I)V

    .line 1517
    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    if-eqz v6, :cond_9

    .line 1518
    iget-wide v6, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->adler:J

    const/16 v8, 0x10

    ushr-long/2addr v6, v8

    long-to-int v6, v6

    invoke-direct {p0, v6}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->putShortMSB(I)V

    .line 1519
    iget-wide v6, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->adler:J

    const-wide/32 v8, 0xffff

    and-long/2addr v6, v8

    long-to-int v6, v6

    invoke-direct {p0, v6}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->putShortMSB(I)V

    .line 1521
    :cond_9
    const-wide/16 v6, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-static {v6, v7, v8, v9, v10}, Lorg/jboss/netty/util/internal/jzlib/Adler32;->adler32(J[BII)J

    move-result-wide v6

    iput-wide v6, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->adler:J

    goto :goto_1

    .line 1525
    .end local v1    # "header":I
    .end local v3    # "level_flags":I
    :pswitch_1
    const/16 v6, 0x1f

    invoke-direct {p0, v6}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->put_byte(B)V

    .line 1526
    const/16 v6, -0x75

    invoke-direct {p0, v6}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->put_byte(B)V

    .line 1528
    const/16 v6, 0x8

    invoke-direct {p0, v6}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->put_byte(B)V

    .line 1530
    const/4 v6, 0x0

    invoke-direct {p0, v6}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->put_byte(B)V

    .line 1532
    const/4 v6, 0x0

    invoke-direct {p0, v6}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->put_byte(B)V

    .line 1533
    const/4 v6, 0x0

    invoke-direct {p0, v6}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->put_byte(B)V

    .line 1534
    const/4 v6, 0x0

    invoke-direct {p0, v6}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->put_byte(B)V

    .line 1535
    const/4 v6, 0x0

    invoke-direct {p0, v6}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->put_byte(B)V

    .line 1537
    sget-object v6, Lorg/jboss/netty/util/internal/jzlib/Deflate;->config_table:[Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;

    iget v7, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->level:I

    aget-object v6, v6, v7

    iget v6, v6, Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;->func:I

    packed-switch v6, :pswitch_data_1

    .line 1545
    const/4 v6, 0x0

    invoke-direct {p0, v6}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->put_byte(B)V

    .line 1549
    :goto_2
    const/4 v6, -0x1

    invoke-direct {p0, v6}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->put_byte(B)V

    .line 1551
    const/4 v6, 0x0

    iput v6, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->crc32:I

    goto/16 :goto_1

    .line 1539
    :pswitch_2
    const/4 v6, 0x4

    invoke-direct {p0, v6}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->put_byte(B)V

    goto :goto_2

    .line 1542
    :pswitch_3
    const/4 v6, 0x2

    invoke-direct {p0, v6}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->put_byte(B)V

    goto :goto_2

    .line 1575
    :cond_a
    iget v6, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    if-nez v6, :cond_b

    if-gt p2, v4, :cond_b

    const/4 v6, 0x4

    if-eq p2, v6, :cond_b

    .line 1577
    sget-object v6, Lorg/jboss/netty/util/internal/jzlib/Deflate;->z_errmsg:[Ljava/lang/String;

    const/4 v7, 0x7

    aget-object v6, v6, v7

    iput-object v6, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->msg:Ljava/lang/String;

    .line 1578
    const/4 v6, -0x5

    goto/16 :goto_0

    .line 1582
    :cond_b
    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->status:I

    const/16 v7, 0x29a

    if-ne v6, v7, :cond_c

    iget v6, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    if-eqz v6, :cond_c

    .line 1583
    sget-object v6, Lorg/jboss/netty/util/internal/jzlib/Deflate;->z_errmsg:[Ljava/lang/String;

    const/4 v7, 0x7

    aget-object v6, v6, v7

    iput-object v6, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->msg:Ljava/lang/String;

    .line 1584
    const/4 v6, -0x5

    goto/16 :goto_0

    .line 1588
    :cond_c
    iget v5, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 1590
    .local v5, "old_next_in_index":I
    :try_start_0
    iget v6, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    if-nez v6, :cond_d

    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->lookahead:I

    if-nez v6, :cond_d

    if-eqz p2, :cond_15

    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->status:I

    const/16 v7, 0x29a

    if-eq v6, v7, :cond_15

    .line 1592
    :cond_d
    const/4 v0, -0x1

    .line 1593
    .local v0, "bstate":I
    sget-object v6, Lorg/jboss/netty/util/internal/jzlib/Deflate;->config_table:[Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;

    iget v7, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->level:I

    aget-object v6, v6, v7

    iget v6, v6, Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;->func:I

    packed-switch v6, :pswitch_data_2

    .line 1606
    :goto_3
    const/4 v6, 0x2

    if-eq v0, v6, :cond_e

    const/4 v6, 0x3

    if-ne v0, v6, :cond_f

    .line 1607
    :cond_e
    const/16 v6, 0x29a

    iput v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->status:I

    .line 1609
    :cond_f
    if-eqz v0, :cond_10

    const/4 v6, 0x2

    if-ne v0, v6, :cond_12

    .line 1610
    :cond_10
    iget v6, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_out:I

    if-nez v6, :cond_11

    .line 1611
    const/4 v6, -0x1

    iput v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->last_flush:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1613
    :cond_11
    const/4 v6, 0x0

    .line 1644
    iget v7, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->gzipUncompressedBytes:I

    iget v8, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    sub-int/2addr v8, v5

    add-int/2addr v7, v8

    iput v7, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->gzipUncompressedBytes:I

    goto/16 :goto_0

    .line 1595
    :pswitch_4
    :try_start_1
    invoke-direct {p0, p2}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->deflate_stored(I)I

    move-result v0

    .line 1596
    goto :goto_3

    .line 1598
    :pswitch_5
    invoke-direct {p0, p2}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->deflate_fast(I)I

    move-result v0

    .line 1599
    goto :goto_3

    .line 1601
    :pswitch_6
    invoke-direct {p0, p2}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->deflate_slow(I)I

    move-result v0

    .line 1602
    goto :goto_3

    .line 1622
    :cond_12
    const/4 v6, 0x1

    if-ne v0, v6, :cond_15

    .line 1623
    const/4 v6, 0x1

    if-ne p2, v6, :cond_14

    .line 1624
    invoke-direct {p0}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->_tr_align()V

    .line 1636
    :cond_13
    invoke-virtual {p1}, Lorg/jboss/netty/util/internal/jzlib/ZStream;->flush_pending()V

    .line 1637
    iget v6, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_out:I

    if-nez v6, :cond_15

    .line 1638
    const/4 v6, -0x1

    iput v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->last_flush:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1639
    const/4 v6, 0x0

    .line 1644
    iget v7, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->gzipUncompressedBytes:I

    iget v8, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    sub-int/2addr v8, v5

    add-int/2addr v7, v8

    iput v7, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->gzipUncompressedBytes:I

    goto/16 :goto_0

    .line 1626
    :cond_14
    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    :try_start_2
    invoke-direct {p0, v6, v7, v8}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->_tr_stored_block(IIZ)V

    .line 1629
    const/4 v6, 0x3

    if-ne p2, v6, :cond_13

    .line 1631
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_4
    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->hash_size:I

    if-ge v2, v6, :cond_13

    .line 1632
    iget-object v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->head:[S

    const/4 v7, 0x0

    aput-short v7, v6, v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1631
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 1644
    .end local v0    # "bstate":I
    .end local v2    # "i":I
    :cond_15
    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->gzipUncompressedBytes:I

    iget v7, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    sub-int/2addr v7, v5

    add-int/2addr v6, v7

    iput v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->gzipUncompressedBytes:I

    .line 1647
    const/4 v6, 0x4

    if-eq p2, v6, :cond_16

    .line 1648
    const/4 v6, 0x0

    goto/16 :goto_0

    .line 1644
    :catchall_0
    move-exception v6

    iget v7, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->gzipUncompressedBytes:I

    iget v8, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    sub-int/2addr v8, v5

    add-int/2addr v7, v8

    iput v7, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->gzipUncompressedBytes:I

    throw v6

    .line 1651
    :cond_16
    iget-object v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->wrapperType:Lorg/jboss/netty/util/internal/jzlib/JZlib$WrapperType;

    sget-object v7, Lorg/jboss/netty/util/internal/jzlib/JZlib$WrapperType;->NONE:Lorg/jboss/netty/util/internal/jzlib/JZlib$WrapperType;

    if-eq v6, v7, :cond_17

    iget-boolean v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->wroteTrailer:Z

    if-eqz v6, :cond_18

    .line 1652
    :cond_17
    const/4 v6, 0x1

    goto/16 :goto_0

    .line 1655
    :cond_18
    sget-object v6, Lorg/jboss/netty/util/internal/jzlib/Deflate$1;->$SwitchMap$org$jboss$netty$util$internal$jzlib$JZlib$WrapperType:[I

    iget-object v7, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->wrapperType:Lorg/jboss/netty/util/internal/jzlib/JZlib$WrapperType;

    invoke-virtual {v7}, Lorg/jboss/netty/util/internal/jzlib/JZlib$WrapperType;->ordinal()I

    move-result v7

    aget v6, v6, v7

    packed-switch v6, :pswitch_data_3

    .line 1674
    :goto_5
    invoke-virtual {p1}, Lorg/jboss/netty/util/internal/jzlib/ZStream;->flush_pending()V

    .line 1677
    const/4 v6, 0x1

    iput-boolean v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->wroteTrailer:Z

    .line 1678
    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->pending:I

    if-eqz v6, :cond_19

    const/4 v6, 0x0

    goto/16 :goto_0

    .line 1658
    :pswitch_7
    iget-wide v6, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->adler:J

    const/16 v8, 0x10

    ushr-long/2addr v6, v8

    long-to-int v6, v6

    invoke-direct {p0, v6}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->putShortMSB(I)V

    .line 1659
    iget-wide v6, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->adler:J

    const-wide/32 v8, 0xffff

    and-long/2addr v6, v8

    long-to-int v6, v6

    invoke-direct {p0, v6}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->putShortMSB(I)V

    goto :goto_5

    .line 1663
    :pswitch_8
    iget v6, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->crc32:I

    and-int/lit16 v6, v6, 0xff

    int-to-byte v6, v6

    invoke-direct {p0, v6}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->put_byte(B)V

    .line 1664
    iget v6, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->crc32:I

    ushr-int/lit8 v6, v6, 0x8

    and-int/lit16 v6, v6, 0xff

    int-to-byte v6, v6

    invoke-direct {p0, v6}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->put_byte(B)V

    .line 1665
    iget v6, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->crc32:I

    ushr-int/lit8 v6, v6, 0x10

    and-int/lit16 v6, v6, 0xff

    int-to-byte v6, v6

    invoke-direct {p0, v6}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->put_byte(B)V

    .line 1666
    iget v6, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->crc32:I

    ushr-int/lit8 v6, v6, 0x18

    and-int/lit16 v6, v6, 0xff

    int-to-byte v6, v6

    invoke-direct {p0, v6}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->put_byte(B)V

    .line 1667
    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->gzipUncompressedBytes:I

    and-int/lit16 v6, v6, 0xff

    int-to-byte v6, v6

    invoke-direct {p0, v6}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->put_byte(B)V

    .line 1668
    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->gzipUncompressedBytes:I

    ushr-int/lit8 v6, v6, 0x8

    and-int/lit16 v6, v6, 0xff

    int-to-byte v6, v6

    invoke-direct {p0, v6}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->put_byte(B)V

    .line 1669
    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->gzipUncompressedBytes:I

    ushr-int/lit8 v6, v6, 0x10

    and-int/lit16 v6, v6, 0xff

    int-to-byte v6, v6

    invoke-direct {p0, v6}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->put_byte(B)V

    .line 1670
    iget v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->gzipUncompressedBytes:I

    ushr-int/lit8 v6, v6, 0x18

    and-int/lit16 v6, v6, 0xff

    int-to-byte v6, v6

    invoke-direct {p0, v6}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->put_byte(B)V

    goto :goto_5

    .line 1678
    :cond_19
    const/4 v6, 0x1

    goto/16 :goto_0

    .line 1500
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch

    .line 1537
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_2
        :pswitch_3
    .end packed-switch

    .line 1593
    :pswitch_data_2
    .packed-switch 0x0
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch

    .line 1655
    :pswitch_data_3
    .packed-switch 0x1
        :pswitch_7
        :pswitch_8
    .end packed-switch
.end method

.method deflateEnd()I
    .locals 4

    .prologue
    const/16 v3, 0x71

    const/4 v2, 0x0

    .line 1397
    iget v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->status:I

    const/16 v1, 0x2a

    if-eq v0, v1, :cond_0

    iget v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->status:I

    if-eq v0, v3, :cond_0

    iget v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->status:I

    const/16 v1, 0x29a

    if-eq v0, v1, :cond_0

    .line 1399
    const/4 v0, -0x2

    .line 1408
    :goto_0
    return v0

    .line 1402
    :cond_0
    iput-object v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->pending_buf:[B

    .line 1403
    iput-object v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->head:[S

    .line 1404
    iput-object v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->prev:[S

    .line 1405
    iput-object v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    .line 1408
    iget v0, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->status:I

    if-ne v0, v3, :cond_1

    const/4 v0, -0x3

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method deflateInit(Lorg/jboss/netty/util/internal/jzlib/ZStream;IIILorg/jboss/netty/util/internal/jzlib/JZlib$WrapperType;)I
    .locals 8
    .param p1, "strm"    # Lorg/jboss/netty/util/internal/jzlib/ZStream;
    .param p2, "level"    # I
    .param p3, "bits"    # I
    .param p4, "memLevel"    # I
    .param p5, "wrapperType"    # Lorg/jboss/netty/util/internal/jzlib/JZlib$WrapperType;

    .prologue
    .line 1305
    const/16 v3, 0x8

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v4, p3

    move v5, p4

    move-object v7, p5

    invoke-direct/range {v0 .. v7}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->deflateInit2(Lorg/jboss/netty/util/internal/jzlib/ZStream;IIIIILorg/jboss/netty/util/internal/jzlib/JZlib$WrapperType;)I

    move-result v0

    return v0
.end method

.method deflateParams(Lorg/jboss/netty/util/internal/jzlib/ZStream;II)I
    .locals 6
    .param p1, "strm"    # Lorg/jboss/netty/util/internal/jzlib/ZStream;
    .param p2, "_level"    # I
    .param p3, "_strategy"    # I

    .prologue
    .line 1412
    const/4 v0, 0x0

    .line 1414
    .local v0, "err":I
    const/4 v1, -0x1

    if-ne p2, v1, :cond_0

    .line 1415
    const/4 p2, 0x6

    .line 1417
    :cond_0
    if-ltz p2, :cond_1

    const/16 v1, 0x9

    if-gt p2, v1, :cond_1

    if-ltz p3, :cond_1

    const/4 v1, 0x2

    if-le p3, v1, :cond_2

    .line 1419
    :cond_1
    const/4 v1, -0x2

    .line 1436
    :goto_0
    return v1

    .line 1422
    :cond_2
    sget-object v1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->config_table:[Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;

    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->level:I

    aget-object v1, v1, v2

    iget v1, v1, Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;->func:I

    sget-object v2, Lorg/jboss/netty/util/internal/jzlib/Deflate;->config_table:[Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;

    aget-object v2, v2, p2

    iget v2, v2, Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;->func:I

    if-eq v1, v2, :cond_3

    iget-wide v2, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->total_in:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-eqz v1, :cond_3

    .line 1425
    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Lorg/jboss/netty/util/internal/jzlib/ZStream;->deflate(I)I

    move-result v0

    .line 1428
    :cond_3
    iget v1, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->level:I

    if-eq v1, p2, :cond_4

    .line 1429
    iput p2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->level:I

    .line 1430
    sget-object v1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->config_table:[Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;

    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->level:I

    aget-object v1, v1, v2

    iget v1, v1, Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;->max_lazy:I

    iput v1, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->max_lazy_match:I

    .line 1431
    sget-object v1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->config_table:[Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;

    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->level:I

    aget-object v1, v1, v2

    iget v1, v1, Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;->good_length:I

    iput v1, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->good_match:I

    .line 1432
    sget-object v1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->config_table:[Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;

    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->level:I

    aget-object v1, v1, v2

    iget v1, v1, Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;->nice_length:I

    iput v1, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->nice_match:I

    .line 1433
    sget-object v1, Lorg/jboss/netty/util/internal/jzlib/Deflate;->config_table:[Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;

    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->level:I

    aget-object v1, v1, v2

    iget v1, v1, Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;->max_chain:I

    iput v1, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->max_chain_length:I

    .line 1435
    :cond_4
    iput p3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strategy:I

    move v1, v0

    .line 1436
    goto :goto_0
.end method

.method deflateSetDictionary(Lorg/jboss/netty/util/internal/jzlib/ZStream;[BI)I
    .locals 8
    .param p1, "strm"    # Lorg/jboss/netty/util/internal/jzlib/ZStream;
    .param p2, "dictionary"    # [B
    .param p3, "dictLength"    # I

    .prologue
    const/4 v3, 0x0

    .line 1440
    move v1, p3

    .line 1441
    .local v1, "length":I
    const/4 v0, 0x0

    .line 1443
    .local v0, "index":I
    if-eqz p2, :cond_0

    iget v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->status:I

    const/16 v5, 0x2a

    if-eq v4, v5, :cond_2

    .line 1444
    :cond_0
    const/4 v3, -0x2

    .line 1473
    :cond_1
    return v3

    .line 1447
    :cond_2
    iget-wide v4, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->adler:J

    invoke-static {v4, v5, p2, v3, p3}, Lorg/jboss/netty/util/internal/jzlib/Adler32;->adler32(J[BII)J

    move-result-wide v4

    iput-wide v4, p1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->adler:J

    .line 1449
    const/4 v4, 0x3

    if-lt v1, v4, :cond_1

    .line 1452
    iget v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->w_size:I

    add-int/lit16 v4, v4, -0x106

    if-le v1, v4, :cond_3

    .line 1453
    iget v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->w_size:I

    add-int/lit16 v1, v4, -0x106

    .line 1454
    sub-int v0, p3, v1

    .line 1456
    :cond_3
    iget-object v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    invoke-static {p2, v0, v4, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1457
    iput v1, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->strstart:I

    .line 1458
    iput v1, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->block_start:I

    .line 1464
    iget-object v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    aget-byte v4, v4, v3

    and-int/lit16 v4, v4, 0xff

    iput v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->ins_h:I

    .line 1465
    iget v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->ins_h:I

    iget v5, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->hash_shift:I

    shl-int/2addr v4, v5

    iget-object v5, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    const/4 v6, 0x1

    aget-byte v5, v5, v6

    and-int/lit16 v5, v5, 0xff

    xor-int/2addr v4, v5

    iget v5, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->hash_mask:I

    and-int/2addr v4, v5

    iput v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->ins_h:I

    .line 1467
    const/4 v2, 0x0

    .local v2, "n":I
    :goto_0
    add-int/lit8 v4, v1, -0x3

    if-gt v2, v4, :cond_1

    .line 1468
    iget v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->ins_h:I

    iget v5, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->hash_shift:I

    shl-int/2addr v4, v5

    iget-object v5, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->window:[B

    add-int/lit8 v6, v2, 0x3

    add-int/lit8 v6, v6, -0x1

    aget-byte v5, v5, v6

    and-int/lit16 v5, v5, 0xff

    xor-int/2addr v4, v5

    iget v5, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->hash_mask:I

    and-int/2addr v4, v5

    iput v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->ins_h:I

    .line 1470
    iget-object v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->prev:[S

    iget v5, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->w_mask:I

    and-int/2addr v5, v2

    iget-object v6, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->head:[S

    iget v7, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->ins_h:I

    aget-short v6, v6, v7

    aput-short v6, v4, v5

    .line 1471
    iget-object v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->head:[S

    iget v5, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->ins_h:I

    int-to-short v6, v2

    aput-short v6, v4, v5

    .line 1467
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method pqdownheap([SI)V
    .locals 5
    .param p1, "tree"    # [S
    .param p2, "k"    # I

    .prologue
    .line 316
    iget-object v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap:[I

    aget v1, v2, p2

    .line 317
    .local v1, "v":I
    shl-int/lit8 v0, p2, 0x1

    .line 318
    .local v0, "j":I
    :goto_0
    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap_len:I

    if-gt v0, v2, :cond_1

    .line 320
    iget v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap_len:I

    if-ge v0, v2, :cond_0

    iget-object v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap:[I

    add-int/lit8 v3, v0, 0x1

    aget v2, v2, v3

    iget-object v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap:[I

    aget v3, v3, v0

    iget-object v4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->depth:[B

    invoke-static {p1, v2, v3, v4}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->smaller([SII[B)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 321
    add-int/lit8 v0, v0, 0x1

    .line 324
    :cond_0
    iget-object v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap:[I

    aget v2, v2, v0

    iget-object v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->depth:[B

    invoke-static {p1, v1, v2, v3}, Lorg/jboss/netty/util/internal/jzlib/Deflate;->smaller([SII[B)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 334
    :cond_1
    iget-object v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap:[I

    aput v1, v2, p2

    .line 335
    return-void

    .line 329
    :cond_2
    iget-object v2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap:[I

    iget-object v3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate;->heap:[I

    aget v3, v3, v0

    aput v3, v2, p2

    .line 330
    move p2, v0

    .line 332
    shl-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method
