.class abstract Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;
.super Ljava/lang/Object;
.source "ConcurrentHashMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/util/internal/ConcurrentHashMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x400
    name = "HashIterator"
.end annotation


# instance fields
.field currentKey:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TK;"
        }
    .end annotation
.end field

.field currentTable:[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field lastReturned:Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field nextEntry:Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field nextSegmentIndex:I

.field nextTableIndex:I

.field final synthetic this$0:Lorg/jboss/netty/util/internal/ConcurrentHashMap;


# direct methods
.method constructor <init>(Lorg/jboss/netty/util/internal/ConcurrentHashMap;)V
    .locals 1

    .prologue
    .line 1093
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>.HashIterator;"
    iput-object p1, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->this$0:Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1094
    iget-object v0, p1, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->segments:[Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->nextSegmentIndex:I

    .line 1095
    const/4 v0, -0x1

    iput v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->nextTableIndex:I

    .line 1096
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->advance()V

    .line 1097
    return-void
.end method


# virtual methods
.method final advance()V
    .locals 5

    .prologue
    .line 1114
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>.HashIterator;"
    iget-object v2, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->nextEntry:Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->nextEntry:Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    iget-object v2, v2, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->next:Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    iput-object v2, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->nextEntry:Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    if-eqz v2, :cond_1

    .line 1136
    :cond_0
    :goto_0
    return-void

    .line 1118
    :cond_1
    iget v2, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->nextTableIndex:I

    if-ltz v2, :cond_2

    .line 1119
    iget-object v2, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->currentTable:[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    iget v3, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->nextTableIndex:I

    add-int/lit8 v4, v3, -0x1

    iput v4, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->nextTableIndex:I

    aget-object v2, v2, v3

    iput-object v2, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->nextEntry:Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    if-eqz v2, :cond_1

    goto :goto_0

    .line 1124
    :cond_2
    iget v2, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->nextSegmentIndex:I

    if-ltz v2, :cond_0

    .line 1125
    iget-object v2, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->this$0:Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    iget-object v2, v2, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->segments:[Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;

    iget v3, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->nextSegmentIndex:I

    add-int/lit8 v4, v3, -0x1

    iput v4, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->nextSegmentIndex:I

    aget-object v1, v2, v3

    .line 1126
    .local v1, "seg":Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment<TK;TV;>;"
    iget v2, v1, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->count:I

    if-eqz v2, :cond_2

    .line 1127
    iget-object v2, v1, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->table:[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    iput-object v2, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->currentTable:[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    .line 1128
    iget-object v2, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->currentTable:[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    array-length v2, v2

    add-int/lit8 v0, v2, -0x1

    .local v0, "j":I
    :goto_1
    if-ltz v0, :cond_2

    .line 1129
    iget-object v2, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->currentTable:[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    aget-object v2, v2, v0

    iput-object v2, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->nextEntry:Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    if-eqz v2, :cond_3

    .line 1130
    add-int/lit8 v2, v0, -0x1

    iput v2, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->nextTableIndex:I

    goto :goto_0

    .line 1128
    :cond_3
    add-int/lit8 v0, v0, -0x1

    goto :goto_1
.end method

.method public hasMoreElements()Z
    .locals 1

    .prologue
    .line 1110
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>.HashIterator;"
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public hasNext()Z
    .locals 1

    .prologue
    .line 1139
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>.HashIterator;"
    :goto_0
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->nextEntry:Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    if-eqz v0, :cond_1

    .line 1140
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->nextEntry:Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->key()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1141
    const/4 v0, 0x1

    .line 1146
    :goto_1
    return v0

    .line 1143
    :cond_0
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->advance()V

    goto :goto_0

    .line 1146
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method nextEntry()Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 1151
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>.HashIterator;"
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->nextEntry:Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    if-nez v0, :cond_1

    .line 1152
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0

    .line 1155
    :cond_1
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->nextEntry:Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    iput-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->lastReturned:Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    .line 1156
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->lastReturned:Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->key()Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->currentKey:Ljava/lang/Object;

    .line 1157
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->advance()V

    .line 1158
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->currentKey:Ljava/lang/Object;

    if-eqz v0, :cond_0

    .line 1160
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->lastReturned:Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    return-object v0
.end method

.method public remove()V
    .locals 2

    .prologue
    .line 1164
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>.HashIterator;"
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->lastReturned:Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    if-nez v0, :cond_0

    .line 1165
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 1167
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->this$0:Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    iget-object v1, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->currentKey:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1168
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->lastReturned:Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    .line 1169
    return-void
.end method

.method public rewind()V
    .locals 2

    .prologue
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>.HashIterator;"
    const/4 v1, 0x0

    .line 1100
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->this$0:Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    iget-object v0, v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->segments:[Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->nextSegmentIndex:I

    .line 1101
    const/4 v0, -0x1

    iput v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->nextTableIndex:I

    .line 1102
    iput-object v1, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->currentTable:[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    .line 1103
    iput-object v1, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->nextEntry:Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    .line 1104
    iput-object v1, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->lastReturned:Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    .line 1105
    iput-object v1, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->currentKey:Ljava/lang/Object;

    .line 1106
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;->advance()V

    .line 1107
    return-void
.end method
