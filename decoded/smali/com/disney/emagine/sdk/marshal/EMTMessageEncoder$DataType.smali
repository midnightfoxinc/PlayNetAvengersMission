.class public Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$DataType;
.super Ljava/lang/Object;
.source "EMTMessageEncoder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "DataType"
.end annotation


# static fields
.field public static final ARRAY:S = 0x5s

.field public static final BOOLEAN:S = 0xas

.field public static final LONG_BINARY:S = 0x9s

.field public static final MAP:S = 0x6s

.field public static final MEDIUM_BINARY:S = 0x8s

.field public static final NULL:S = 0xbs

.field public static final NUM_16BIT:S = 0x1s

.field public static final NUM_32BIT:S = 0x2s

.field public static final NUM_64BIT:S = 0x3s

.field public static final NUM_8BIT:S = 0x0s

.field public static final SHORT_BINARY:S = 0x7s

.field public static final STRING:S = 0x4s


# instance fields
.field final synthetic this$0:Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder;


# direct methods
.method public constructor <init>(Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder;)V
    .locals 0
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder;

    .prologue
    .line 27
    iput-object p1, p0, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$DataType;->this$0:Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
