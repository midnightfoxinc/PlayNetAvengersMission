.class public Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageVersion;
.super Ljava/lang/Object;
.source "EMTMessageEncoder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MessageVersion"
.end annotation


# static fields
.field public static final COMPLEX:S = 0x1s

.field public static final SIMPLE:S


# instance fields
.field final synthetic this$0:Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder;


# direct methods
.method public constructor <init>(Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder;)V
    .locals 0
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder;

    .prologue
    .line 21
    iput-object p1, p0, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageVersion;->this$0:Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
